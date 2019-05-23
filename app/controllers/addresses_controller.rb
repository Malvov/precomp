class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = Address.where params[:provider_id]
  end

  def show
  end

  def new
    @address = Address.new provider_id: params[:provider_id]
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_address
    @address = Address.find params[:id]
  end

  def address_params
    params.require(:address).permit(:latitude, :longitude, :description)
  end
end
