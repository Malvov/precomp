class DeviseUsers::SessionsController < Devise::SessionsController
    prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.
  
    private
      def check_captcha
        unless verify_recaptcha
          self.resource = resource_class.new sign_in_params
          flash.delete(:recaptcha_error)
          flash[:error] = 'Hubo un problema con el Captcha'
          #resource.valid? # Look for any other validation errors besides Recaptcha
          # set_minimum_password_length
          redirect_to new_user_session_path
        end 
      end
end