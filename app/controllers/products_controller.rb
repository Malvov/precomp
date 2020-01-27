require 'will_paginate/array'

class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_currency, only: [:edit, :new, :create, :update]
  load_and_authorize_resource except: [:index, :show, :remove_attachment]
  
  # GET /products
  # GET /products.json
  def index
    products = Product.all
    if params[:category]
      products = Product.where category_id: params[:category]
      products = Product.actives.merge products
    elsif params[:search]
      filter = params[:search][:terms] || ''
      filtered_products = products.global_search("#{filter}").to_a
      products = Product.actives.merge filtered_products
    else
      products = Product.actives
    end
    @products = products.paginate page: params[:page], per_page: 8
  end

  # GET /products/1
  # GET /products/1.json
  def show
    # :open_mouth:
    @offers = Product.related_products_by_category(@product.category_id, @product.provider_id)
    @product_as_json = @product.as_json
    @product_as_json['category_description'] = @product.category.description
  end

  # GET /products/new
  def new
    @product = Product.new
    @product.provider_id = current_user.provider.id
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

    redirect_to edit_product_path(@product), notice: 'Imagen removida correctamente.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find(params[:id])
    end

    def set_currency
      @currency = Product::CURRENCY
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit :name, 
        :description, :trademark, :measurement_unit, :estimated_delivery_time, :category_id,
        :price, :time_span, :currency, :available, tags: [], images: [] 
    end
end
