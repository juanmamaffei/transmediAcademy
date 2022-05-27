class UserContentsController < ApplicationController
  before_action :set_user_content, only: %i[show edit update destroy ban pinup]
  before_action :set_content
  before_action :authenticate_user!
  before_action :check_owner, only: %i[edit update destroy]
  before_action :check_permissions, only: %i[ban pinup]

  respond_to :js, :html, :json

  # GET /user_contents or /user_contents.json
  def index
    @user_contents = UserContent.where(content_id: @content).order(created_at: :desc)
  end

  # GET /user_contents/1 or /user_contents/1.json
  def show; end

  # GET /user_contents/1/banear
  def ban
    # Sólo pueden BANEAR los tutores
    if @permissions >= 20

      # Si está baneado lo publicamos
      if @user_content.banned?
        @user_content.publish!
        redirect_to content_user_contents_path(@content), notice: 'Publicamos el contenido.'
      # Si está publicado (o fijado) lo baneamos
      else
        @user_content.ban!
        redirect_to content_user_contents_path(@content), notice: 'Censuramos el contenido.'
      end
    else
      # Redirigir
      redirect_to root_path, notice: 'No tenés permiso para esto'
    end
  end

  # GET /user_contents/1/fijar
  def pinup
    # Sólo pueden FIJAR los tutores
    if @permissions >= 20

      # Si está baneado lo publicamos
      if @user_content.published?
        @user_content.pinup!
        redirect_to content_user_contents_path(@content), notice: 'Fijamos el contenido como destacado.'
      # Si está publicado (o fijado) lo baneamos
      elsif @user_content.featured?
        @user_content.unpinup!
        redirect_to content_user_contents_path(@content), notice: 'Dejamos de destacar este contenido.'
      # Si no probablemente esté baneado.
      else
        redirect_to content_user_contents_path(@content),
                    notice: 'No pudimos fijar el contenido. Verificá que no esté baneado.'
      end

    else
      # Redirigir
      redirect_to root_path, notice: 'No tenés permiso para esto'
    end
  end

  # GET /user_contents/new
  def new
    @user_content = UserContent.new
  end

  # GET /user_contents/1/edit
  def edit; end

  # POST /user_contents or /user_contents.json
  def create
    @user_content = UserContent.new(user_content_params)
    @user_content.user_id = current_user.id
    @user_content.content_id = @content.id

    respond_to do |format|
      if @user_content.save
        format.html do
          redirect_to content_user_contents_path, notice: '¡Bien ahí! Acabás de crear un contenido, crack.'
        end
        format.json { render :show, status: :created, location: @user_content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_contents/1 or /user_contents/1.json
  def update
    respond_to do |format|
      if @user_content.update(user_content_params)
        format.html do
          redirect_to content_user_contents_path, notice: 'Ya cambiamos el contenido, tal como lo pediste.'
        end
        format.json { render :show, status: :ok, location: @user_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_contents/1 or /user_contents/1.json
  def destroy
    @user_content.destroy
    respond_to do |format|
      format.html { redirect_to content_user_contents_path, notice: 'Ya borramos el contenido.' }
      format.json { head :no_content }
    end
  end

  def like
    @user_content = UserContent.find(params[:id])
    if params[:format] == 'like'
      @user_content.liked_by current_user
    elsif params[:format] == 'unlike'
      @user_content.unliked_by current_user
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_content
    @user_content = UserContent.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_content_params
    params.require(:user_content).permit(:markdownContent, :content_type, :sticked, :claps, :responseTo, :user_id,
                                         :content_id)
  end

  def set_content
    @content = Content.find(params[:content_id])
  end

  def check_owner
    redirect_to root_path, notice: 'No estás autorizado a hacer eso.' unless @user_content.user == current_user
  end

  def check_permissions
    matricula = Matriculation.find_by(user: current_user, course: @content.course)

    @permissions = if matricula.nil?
                     0
                   else
                     matricula.permissions
                   end
  end
end
