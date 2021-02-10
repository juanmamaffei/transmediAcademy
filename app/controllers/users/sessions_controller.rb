# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end
  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    redirect_to root_path
  end
  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  
  # protected
  private
  def user_params
    params.require(:user).permit(:name, :email_address, :password, :avatar)
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
