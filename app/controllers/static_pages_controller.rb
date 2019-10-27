class StaticPagesController < ApplicationController
  def index
    @categories = Category.all.sample(4)
    @newer_products = Product.newer
  end

  def advanced_search
  end
end
