class AddressesController < ApplicationController
  before_action :set_provider, only: [:new, :index]
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = Address.where provider_id: @provider.id
    @addresses_to_json = @addresses.to_json
  end

  def show
  end

  def new
    @address = Address.new provider_id: @provider.id
  end

  def create
    @address = Address.new(address_params)
    @address.provider_id = params[:provider_id]
    respond_to do |format|
      if @address.save
        format.html { redirect_to provider_branch_offices_path(@address.provider), notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    authorize! :update, @address
  end

  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to provider_path(@address.provider), notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

  def set_address
    @address = Address.find params[:id]
  end

  def set_provider
    @provider = Provider.friendly.find params[:provider_id]
  end

  def address_params
    params.require(:address).permit(:latitude, :longitude, :description)
  end
end
