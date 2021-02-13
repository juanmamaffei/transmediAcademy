class HomeController < ApplicationController
  def index
    @courses = Course.all.take(6)
  end
end
