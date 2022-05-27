class PointsController < ApplicationController
  before_action :set_content
  before_action :authenticate_user!

  def assign
    # Se le pasa el usuario, contenido y test como parámetros guarda un nuevo registro
    # En principio, se hace en el test_controller
  end

  def destroy
    # Sólo pueden utilizarla los administradores. Borra un registro
  end

  def consult
    # Se le pasa el usuario y contenido como parámetros y devuelve la suma de los puntos
    @points = Point.where(user: current_user, content: @content)
  end

  private

  def set_content
    @content = Content.find(params[:content_id])
  end
end
