class FavoriteProductsController < ApplicationController
    # will have to check this better
    #before_action :authenticate_user!
    skip_before_action :verify_authenticity_token

    def index
        @favorite_products = current_user.favorite_products.actives
    end

    def create
        if current_user
            @product = Product.friendly.find params[:product_id]
            if @product
                current_user.favorite_products << @product
                render json: { success: true, marked: true }, status: 200
            else
                render json: { success: false }, status: 404
            end
            
        else
            respond_to do |format|
                format.html { redirect_to new_user_session_path, notice: 'Por favor inicie sesión' }
            end
        end
    end

    def destroy
        @product = Product.friendly.find params[:id]
        current_user.favorite_products.delete @product
        render json: { success: true, marked: false }, status: 200
    end

end