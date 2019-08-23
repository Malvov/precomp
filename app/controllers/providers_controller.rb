class ProvidersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_provider, only: [:show, :edit, :update, :destroy]
  #load_and_authorize_resource except: :new

  # GET /providers
  # GET /providers.json
  def index
    @providers = Provider.all
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
    @addresses = @provider.addresses.to_json
  end

  # GET /providers/new
  def new
    unless current_user.provider.nil?
      redirect_to profile_path, notice: 'No se puede completar esta acción. Usted ya tiene una cuenta de proveedor.'    
    else
      @provider = Provider.new
    end
  end

  # GET /providers/1/edit
  def edit
    authorize! :edit, @provider
  end

  # POST /providers
  # POST /providers.json
  def create
    @provider = Provider.new(provider_params)
    @provider.user = current_user

    respond_to do |format|
      if @provider.save
        format.html { redirect_to profile_path, notice: 'Espere la activación de su cuenta por un administrador.' }
        format.json { render :show, status: :created, location: @provider }
      else
        format.html { render :new }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /providers/1
  # PATCH/PUT /providers/1.json
  def update
    respond_to do |format|
      if @provider.update(provider_params)
        format.html { redirect_to profile_path, notice: 'Sus datos fueron correctamente actualizados.' }
        format.json { render :show, status: :ok, location: @provider }
      else
        format.html { render :edit }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /providers/1
  # DELETE /providers/1.json
  def destroy
    @provider.destroy
    respond_to do |format|
      format.html { redirect_to providers_url, notice: 'Provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_params
      params.require(:provider).permit(:name, :contact, 
        :phone, :personal_contact, :administrative_contact, 
        :email, :webpage_link, :address, :logo)
    end
end
