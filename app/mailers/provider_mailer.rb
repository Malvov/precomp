class ProviderMailer < ApplicationMailer
    def new
        @provider_name = params[:provider_name]
        @email = params[:email]
        @from = params[:from]
        @contact_email = params[:contact_email]
        @phone_number = params[:phone_number]
        @body = params[:body]

        mail to: @email, subject: 'Nuevo mensaje de Precomp.com.ni'
    end
end
