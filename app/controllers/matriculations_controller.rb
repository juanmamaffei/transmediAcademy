class MatriculationsController < ApplicationController
  before_action :set_matriculation, only: %i[show edit update destroy]
  before_action :authenticate_user!

  before_action :check_god

  # GET /matriculations or /matriculations.json
  def index
    @matriculations = Matriculation.all
  end

  # GET /matriculations/1 or /matriculations/1.json
  def show; end

  # GET /matriculations/new
  def new
    @matriculation = Matriculation.new
  end

  # GET /matriculations/1/edit
  def edit; end

  # POST /matriculations or /matriculations.json
  def create
    @matriculation = Matriculation.new(matriculation_params)
    @matriculation.user_id = params[:matriculation][:user]
    @matriculation.course_id = params[:matriculation][:course]

    respond_to do |format|
      if @matriculation.save
        format.html { redirect_to @matriculation, notice: 'Matriculation was successfully created.' }
        format.json { render :show, status: :created, location: @matriculation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @matriculation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matriculations/1 or /matriculations/1.json
  def update
    respond_to do |format|
      if @matriculation.update(matriculation_params)
        format.html { redirect_to @matriculation, notice: 'Matriculation was successfully updated.' }
        format.json { render :show, status: :ok, location: @matriculation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @matriculation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matriculations/1 or /matriculations/1.json
  def destroy
    @matriculation.destroy
    respond_to do |format|
      format.html { redirect_to matriculations_url, notice: 'Matriculation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_matriculation
    @matriculation = Matriculation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def matriculation_params
    params.require(:matriculation).permit(:user_id, :course_id, :permissions)
  end

  def check_god
    if current_user.permissions.nil?
      redirect_to root_path, notice: 'Pfff... Tomate el palo...'
    else
      redirect_to root_path, notice: 'Naaa. Estás re loco vo, amigo.' unless current_user.permissions >= 50
    end
  end
end
