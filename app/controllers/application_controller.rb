class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_locale


    rescue_from CanCan::AccessDenied do |exception|
      flash[:notice] = exception.message
      redirect_to main_app.root_path
    end

    def set_locale
      if [RailsAdmin].include?(self.class.parent)
        I18n.locale = :en
      else
        I18n.locale = I18n.default_locale
      end
    end

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
