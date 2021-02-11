class TestsController < ApplicationController
  before_action :set_test, only: %i[ show edit update destroy ]

  # GET /tests or /tests.json
  def index
    @tests = Test.all
  end

  # GET /tests/1 or /tests/1.json
  def show
    # Si el visitante es alumno y nunca tomó el test,
    # la vista mostrará las preguntas mezcladas pero no la respuesta.
    # Al hacer clic en una de las respuestas, se enviará a CORREGIR
  end

  # GET /tests/new
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests or /tests.json
  def create
    @test = Test.new(test_params)
    @test.content_id = params[:test][:content]

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: "Creaste una prueba ;-)" }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1 or /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: "Modificaste una prueba. Ya no se van a machetear..." }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1 or /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: "Borraste una prueba." }
      format.json { head :no_content }
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

      # Dirige al contenido
      redirect_to content_path(@test.content_id), notice: "Bien ahí... ya podés pasar al siguiente contenido."
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

    # Only allow a list of trusted parameters through.
    def test_params
      params.require(:test).permit(:question, :a1, :a2, :a3, :a4, :correct, :content_id, :score, :difficulty, :state)
    end
end
