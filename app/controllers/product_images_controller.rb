class ProductImagesController < ApplicationController
    def index
        @image_urls = []
        @product = Product.find params[:product_id]
        @product.images.each do |image|
            @image_urls << { url: url_for(image) }
        end

        render json: @image_urls
    end
end