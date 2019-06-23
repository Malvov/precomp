class UsersController < ApplicationController
    before_action :authenticate_user!
    def show
        @user = current_user
        @provider = @user.provider if @user.provider
        @products = @provider.products if @provider 
    end
end