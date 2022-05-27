class LeadsController < ApplicationController
  before_action :set_lead, only: %i[show edit update destroy]

  before_action :authenticate_user!, only: %i[show index edit update destroy]
  before_action :check_god, only: %i[show index edit update destroy]

  # GET /leads or /leads.json
  def index
    @leads = Lead.all
  end

  # GET /leads/1 or /leads/1.json
  def show; end

  # GET /leads/new
  def new
    @lead = Lead.new
    courses = Course.select(:id, :name).all

    @courses = []
    courses.each do |c|
      @courses.push([c.name, c.id])
    end
  end

  # GET /leads/1/edit
  def edit; end

  # POST /leads or /leads.json
  def create
    @lead = Lead.new(lead_params)

    @lead.user = current_user if user_signed_in?
    @lead.status = 0
    respond_to do |format|
      if @lead.save
        format.html { redirect_to root_path, notice: 'En breve nos vamos a comunicar con vos :-)' }
        format.json { render :show, status: :created, location: @lead }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leads/1 or /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
        format.html { redirect_to @lead, notice: 'Lead was successfully updated.' }
        format.json { render :show, status: :ok, location: @lead }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1 or /leads/1.json
  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to leads_url, notice: 'Lead was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lead
    @lead = Lead.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lead_params
    params.require(:lead).permit(:user, :status, :course, :name, :email, :info)
  end

  def check_god
    if current_user.permissions.nil?
      redirect_to root_path, notice: 'Pfff... Tomate el palo...'
    else
      redirect_to root_path, notice: 'Naaa. Estás re loco vo, amigo.' unless current_user.permissions >= 50
    end
  end
end
