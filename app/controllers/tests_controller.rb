class TestsController < ApplicationController
  before_action :set_test, only: %i[ show edit update destroy ]
  before_action :set_content

  before_action :check_permissions

  # GET /tests or /tests.json
  def index

    # Sólo acceden los tutores
    if @permissions >= 20
      #Lo que se puede hacer
      @tests = Test.where(content_id: @content.id)
    elsif @permissions >= 10
      #Tomar uno random PERO SE DEBERÍAN FILTRAR LOS QUE EL ESTUDIANTE YA APROBÓ (están en el modelo Points)
      
      #seleccionar el current_user y el contenido para consultar todos los test que coincidan
      tests_hechos = Point.select(:test_id).where(user: current_user, content: @content)
      
      tests_hechos_array =[]
      tests_hechos.each do |t|
        tests_hechos_array << t.test_id
      end
      
      untest = Test.where(content_id: @content.id).where.not(id: tests_hechos_array).order("RANDOM()").first

      unless untest == nil
        redirect_to content_test_path(@content, untest)
      else
        redirect_to content_path(@content), notice: "No hay tests para este contenido."
      end
    else
      #Redirigir al root
      redirect_to root_path, notice: "No tenés permiso para esto, chinwenwencha."
    end

  end

  # GET /tests/1 or /tests/1.json
  def show
    # Si el visitante es alumno y nunca tomó el test,
    # la vista mostrará las preguntas mezcladas pero no la respuesta.
    # Al hacer clic en una de las respuestas, se enviará a CORREGIR
    
    # Sólo acceden los estudiantes
    unless @permissions >= 10
      redirect_to root_path, notice: "No tenés permiso para esto, chinwenwencha."
    end

  end

  # GET /tests/new
  def new
    
    # Sólo acceden los tutores
    if @permissions >= 20
      @test = Test.new
    else
        #Redirigir
        redirect_to root_path, notice: "No tenés permiso para esto, chinwenwencha."
    end
  end

  # GET /tests/1/edit
  def edit
    # Sólo acceden los tutores
    unless @permissions >= 20
      redirect_to root_path, notice: "No tenés permiso para esto, chinwenwencha."
    end
  end

  # POST /tests or /tests.json
  def create
    # Sólo acceden los tutores
    if @permissions >= 20
      

      @test = Test.new(test_params)
      @test.content_id = params[:test][:content]
  
      respond_to do |format|
        if @test.save
          format.html { redirect_to content_test_path(@content, @test), notice: "Creaste una prueba ;-)" }
          format.json { render :show, status: :created, location: @test }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @test.errors, status: :unprocessable_entity }
        end
      end

    else
        #Redirigir
        redirect_to root_path, notice: "No tenés permiso para esto, chinwenwencha."
    end
    
    

  end

  # PATCH/PUT /tests/1 or /tests/1.json
  def update

    # Sólo acceden los tutores
    if @permissions >= 20
      
      respond_to do |format|
        if @test.update(test_params)
          format.html { redirect_to content_test_path(@content, @test), notice: "Modificaste una prueba. Ya no se van a machetear..." }
          format.json { render :show, status: :ok, location: @test }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @test.errors, status: :unprocessable_entity }
        end
      end
    else
        #Redirigir
        redirect_to root_path, notice: "No tenés permiso para esto, chinwenwencha."
    end


  end

  # DELETE /tests/1 or /tests/1.json
  def destroy

      # Sólo acceden los tutores
      if @permissions >= 20
        @test.destroy
        respond_to do |format|
          format.html { redirect_to content_tests_path, notice: "Borraste una prueba." }
          format.json { head :no_content }
        end
      else
          #Redirigir
          redirect_to root_path, notice: "No tenés permiso para esto, chinwenwencha."
      end

  end
  
  # POST corregir/1
  def corregir
    # Recibe un parámetro :ans y un test_id 
    ans = params[:ans].to_i
    @test = Test.find(params[:test_id])
    # Verifica si la respuesta es correcta
    if @test.correct == ans
      # Registra la respuesta en el log
      
      log = Point.new(:test => @test, :user => current_user, :content => @content, :score => @test.score)
      
      log.save


      # Dirige al contenido
      redirect_to content_path(@test.content_id), notice: "Bien ahí, crack ;-)"
    else
      #Dirige al contenido y te dice que pifiaste
      redirect_to content_path(@test.content_id), notice: "Te equivocaste... No pasa nada, pero quizás necesites volver a revisar el contenido."
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    def set_content
      @content = Content.find(params[:content_id])
    end
    

    # Only allow a list of trusted parameters through.
    def test_params
      params.require(:test).permit(:question, :a1, :a2, :a3, :a4, :correct, :content_id, :score, :difficulty, :state)
    end

    def check_permissions
      
      cap = Content.find_by(id: params[:content_id])
      course = Course.find(cap.course_id)

      matricula = Matriculation.find_by(user: current_user, course: course)

      if matricula == nil
        @permissions = 0
      else
        @permissions = matricula.permissions
      end
  end

end
