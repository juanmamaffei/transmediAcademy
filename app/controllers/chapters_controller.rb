class ChaptersController < ApplicationController
  before_action :set_chapter, only: %i[ show edit update destroy ]
  before_action :set_course
  before_action :authenticate_user!
  before_action :check_permissions


  # GET /chapters or /chapters.json
  def index
    # Sólo acceden los alumnos
    if @permissions >= 10
      
      @chapters = Chapter.where(course_id:@course)
    else
      #Redirigir
      redirect_to root_path, notice: "No tenés permiso para esto, chinwenwencha."
    end
  
  end

  # GET /chapters/1 or /chapters/1.json
  def show
    
    # Sólo acceden los alumnos
    if @permissions >= 10
      
      @contents = Content.where(course_id: @course.id, chapter_id: @chapter.id).order("sequence ASC, created_at DESC")
    else
      #Redirigir
      redirect_to root_path, notice: "No tenés permiso para esto, chinwenwencha."
    end
  


  end

  # GET /chapters/new
  def new

    # Sólo acceden los tutores
    if @permissions >= 20
      @chapter = Chapter.new
    else
        #Redirigir
        redirect_to root_path, notice: "No tenés permiso para esto, chinwenwencha."
    end
    
  end

  # GET /chapters/1/edit
  def edit
    # Sólo acceden los tutores
    unless @permissions >= 20
      redirect_to root_path, notice: "No tenés permiso para esto, chinwenwencha."
    end
  end

  # POST /chapters or /chapters.json
  def create


    # Sólo acceden los tutores
    if @permissions >= 20
      @chapter = Chapter.new(chapter_params)
      @chapter.course_id = @course.id
  
      respond_to do |format|
        if @chapter.save
          format.html { redirect_to @chapter.course, notice: "¡Bien! Acabás de crear un nuevo capítulo." }
          format.json { render :show, status: :created, location: @chapter }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @chapter.errors, status: :unprocessable_entity }
        end
      end
    else
        #Redirigir
        redirect_to root_path, notice: "No tenés permiso para esto, chinwenwencha."
    end
    
  end

  # PATCH/PUT /chapters/1 or /chapters/1.json
  def update
    # Sólo acceden los tutores
    if @permissions >= 20
      respond_to do |format|
        if @chapter.update(chapter_params)
          format.html { redirect_to @chapter.course, notice: "Actualizamos tu capítulo, justo como querías." }
          format.json { render :show, status: :ok, location: @chapter }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @chapter.errors, status: :unprocessable_entity }
        end
      end
    else
        #Redirigir
        redirect_to root_path, notice: "No tenés permiso para esto, chinwenwencha."
    end

  end

  # DELETE /chapters/1 or /chapters/1.json
  def destroy


    # Sólo acceden los tutores
    if @permissions >= 20
      @chapter.destroy
      respond_to do |format|
        format.html { redirect_to course_chapters_url, notice: "Eliminaste un capítulo." }
        format.json { head :no_content }
      end
    else
        #Redirigir
        redirect_to root_path, notice: "No tenés permiso para esto, chinwenwencha."
    end
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chapter_params
      params.require(:chapter).permit(:name, :description, :goals, :course_id, :sequence)
    end
    def set_course
      @course = Course.find(params[:course_id])
    end
    
    def check_permissions
      matricula = Matriculation.find_by(user: current_user, course: @course)

      if matricula == nil
        @permissions = 0
      else
        @permissions = matricula.permissions
      end
  end

end
