class StaticPagesController < ApplicationController
  def index
    @categories = Category.all.sample(4)
    @newer_products = Product.newer
  end

  def about
  end
end
