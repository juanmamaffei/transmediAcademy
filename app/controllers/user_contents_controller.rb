class UserContentsController < ApplicationController
  before_action :set_user_content, only: %i[ show edit update destroy ]
  before_action :set_content
  before_action :set_user

  # GET /user_contents or /user_contents.json
  def index
    @user_contents = UserContent.all
  end

  # GET /user_contents/1 or /user_contents/1.json
  def show
    
  end

  # GET /user_contents/new
  def new
    @user_content = UserContent.new
  end

  # GET /user_contents/1/edit
  def edit
  end

  # POST /user_contents or /user_contents.json
  def create
    @user_content = UserContent.new(user_content_params)
    @user_content.user_id = current_user.id
    @user_content.content_id = @content.id


    respond_to do |format|
      if @user_content.save
        format.html { redirect_to content_user_contents_path, notice: "User content was successfully created." }
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
        format.html { redirect_to content_user_contents_path, notice: "User content was successfully updated." }
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
      format.html { redirect_to content_user_contents_path, notice: "User content was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_content
      @user_content = UserContent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_content_params
      params.require(:user_content).permit(:markdownContent, :content_type, :sticked, :claps, :responseTo, :user_id, :content_id)
    end
    def set_content
      @content = Content.find(params[:content_id])
    end
    def set_user
      #@user = User.find(params[:session_id])
    end

end
