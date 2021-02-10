class ContentsController < ApplicationController
  before_action :set_content, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :set_course, except: %i[ index ]
  before_action :check_permissions, except: %i[ index ]
  before_action :check_god, only: %i[index]

  # GET /contents or /contents.json
  def index
    # Sólo acceden los administradores

      @contents = Content.all

  end

  # GET /contents/1 or /contents/1.json
  def show
      # Sólo acceden los alumnos

      if @permissions >= 10
        cape = Content.find(params[:id])
        @chapter = Chapter.find(cape.chapter_id)    
      else
          #Redirigir
          redirect_to root_path, notice: "No tenés permiso para esto, chinwenwencha."
      end
  end

  # GET /contents/new
  def new
    # Sólo acceden los tutores
    if @permissions >= 20
      @content = Content.new
  else
      #Redirigir
      redirect_to root_path, notice: "No tenés permiso para esto, chinwenwencha."
  end


  end

  # GET /contents/1/edit
  def edit

    # Sólo acceden los tutores
    unless @permissions >= 20
      redirect_to root_path, notice: "No tenés permiso para esto, chinwenwencha."
    end
  end

  # POST /contents or /contents.json
  def create
    
    # Sólo acceden los tutores
    if @permissions >= 20
      
        #content_params["course_id"] = params[:content][:course]
        #content_params["chapter_id"] = params[:content][:chapter]
        @content = Content.new(content_params)
        
        @content.course_id = params[:content][:course]
        @content.chapter_id = params[:content][:chapter]

        respond_to do |format|
          if @content.save
            format.html { redirect_to @content, notice: "¡Bien! Acabás de crear flor de contenido." }
            format.json { render :show, status: :created, location: @content }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @content.errors, status: :unprocessable_entity }
          end
        end
    else
          #Redirigir
          redirect_to root_path, notice: "No tenés permiso para esto, chinwenwencha."
    end

  end

  # PATCH/PUT /contents/1 or /contents/1.json
  def update

    # Sólo acceden los tutores
    if @permissions >= 20
      respond_to do |format|
        if @content.update(content_params)
          format.html { redirect_to @content, notice: "El contenido ya está como a vos te gusta..." }
          format.json { render :show, status: :ok, location: @content }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @content.errors, status: :unprocessable_entity }
        end
      end
    else
        #Redirigir
        redirect_to root_path, notice: "No tenés permiso para esto, chinwenwencha."
    end


   
  end

  # DELETE /contents/1 or /contents/1.json
  def destroy

    # Sólo acceden los tutores
    if @permissions >= 20
      @content.destroy
      respond_to do |format|
        format.html { redirect_to contents_url, notice: "Borraste un contenido. Bien hecho... no era digno de TransmediAcademy." }
        format.json { head :no_content }
    end
    else
        #Redirigir
        redirect_to root_path, notice: "No tenés permiso para esto, chinwenwencha."
    end

    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_params
      params.require(:content).permit(:course_id, :chapter_id, :name, :sequence, :typeOfContent, :richContent, :priority, :testId, :requirements, :minimumScore, :goals, :embed)
    end
    def set_course
      cap = Content.find(params[:id])
      @course = Course.find(cap.course_id)
    end
    def check_permissions

      matricula = Matriculation.find_by(user: current_user, course: @course)

      if matricula == nil
        @permissions = 0
      else
        @permissions = matricula.permissions
      end
    end

    def check_god
      
      unless current_user.permissions == nil
        unless current_user.permissions >= 50
          redirect_to root_path, notice: "Naaa. Estás re loco vo, amigo."
        end
      else
          redirect_to root_path, notice: "Pfff... Tomate el palo..."
      end
    
    end
end
