class ProductImportsController < ApplicationController
    before_action :authenticate_user!
    def new
        unless current_user.admin?
            redirect_to root_url, notice: 'You\'re not authorized to see this page'
        else
            respond_to do |format|
                format.html
            end
        end
    end
    
    def create
        @product_import = ProductImport.new file: params[:file], provider_id: params[:provider_id]
        @product_import.import
        redirect_to products_path
    end
end