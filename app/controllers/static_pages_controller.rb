class StaticPagesController < ApplicationController
  def index
    @newer_products = Product.newer
  end
end
