class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_currency, only: :edit

  include ActionView::Helpers::NumberHelper
  
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    # :open_mouth:
    product = @product.as_json
    product['category_description'] = @product.category.description
    product['formatted_price'] = formatted_price @product
    @product = product
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new product_params
    @product.provider = current_user.provider
    respond_to do |format|
      if @product.save
        format.html { redirect_to profile_path, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to profile_path, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def remove_attachment
    @image = ActiveStorage::Attachment.find params[:id]
    @product = @image.record
    @image.purge

    redirect_to edit_product_path(@product)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_currency
      @currency = Product::CURRENCY
    end

    def formatted_price product
      return "#{ number_to_currency product.price, locale: 'es-NI' }" if product.currency == 'Córdoba'
      "#{ number_to_currency product.price }"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, 
        :description, :trademark, :measurement_unit, :estimated_delivery_time, :category_id,
        :price, :time_span, :currency, tags: [], images: []
      )
    end
end
