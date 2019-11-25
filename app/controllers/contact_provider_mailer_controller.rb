class ContactProviderMailerController < ApplicationController
    def new
        @provider = Provider.friendly.find params[:provider_id]
    end
    def create
        @provider = Provider.friendly.find params[:provider_id]
        @from ||= params[:contact_provider_mailer][:from]
        @body ||= params[:contact_provider_mailer][:body]
        @contact_email ||= params[:contact_provider_mailer][:contact_email]
        @phone_number ||= params[:contact_provider_mailer][:phone_number]
        ProviderMailer
        .with(email: @provider.email, provider_name: @provider.name, from: @from, body: @body, contact_email: @contact_email, phone_number: @phone_number).new.deliver_now
        
    end
end