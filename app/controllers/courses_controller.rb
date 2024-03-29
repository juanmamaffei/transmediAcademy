class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update destroy]

  before_action :authenticate_user!, except: %i[index]

  before_action :check_permissions, except: %i[index mycourses]

  before_action :check_god, only: %i[new create publish]

  # GET /courses or /courses.json
  def index
    @courses = Course.all
  end

  def mycourses
    miscursos = Matriculation.where('user_id = ?', current_user.id).select(:course_id)
    @courses = Course.where({ id: miscursos })
  end

  # GET /courses/1 or /courses/1.json
  def show
    @chapters = Chapter.where(course_id: @course.id).order('sequence ASC, created_at DESC')
  end

  def publish
    @course = Course.find(params[:course_id])

    if @course.published?
      @course.unpublish!
      redirect_to courses_path, notice: 'Dejamos el curso en borrador'
    else
      @course.publish!
      redirect_to courses_path, notice: 'Publicamos el curso'
    end
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
    # Sólo acceden los tutores
    redirect_to root_path, notice: 'No tenés permiso para esto, chinwenwencha.' unless @permissions >= 20
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'El curso se creó de 10.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    # Sólo acceden los tutores
    if @permissions >= 20
      respond_to do |format|
        if @course.update(course_params)
          format.html { redirect_to @course, notice: 'El curso se actualizó joya.' }
          format.json { render :show, status: :ok, location: @course }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path, notice: 'No tenés permiso para esto, chinwenwencha.'
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    # Sólo acceden los administradores
    if @permissions >= 30
      @course.destroy
      respond_to do |format|
        format.html { redirect_to courses_url, notice: 'Borraste el curso... esperamos que no te arrepientas.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path, notice: 'No tenés permiso para esto, chinwenwencha.'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:name, :description, :category, :price, :goals, :duration, :evaluation,
                                   :visibility)
  end

  def check_permissions
    matricula = Matriculation.find_by(user: current_user, course: @course)

    @permissions = if matricula.nil?
                     0
                   else
                     matricula.permissions
                   end
  end

  def check_god
    if current_user.permissions.nil?
      redirect_to root_path, notice: 'Pfff... Tomate el palo...'
    else
      redirect_to root_path, notice: 'Naaa. Estás re loco vo, amigo.' unless current_user.permissions >= 50
    end
  end
end
