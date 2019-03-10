class HomeController < ApplicationController
  def index
    flash[:notice] = 'notice'
  end
end
