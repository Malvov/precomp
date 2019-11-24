class ContactProviderMailerController < ApplicationController
    def new
        @provider = Provider.friendly.find params[:provider_id]
    end
    def create
        @provider = Provider.friendly.find params[:provider_id]
        @from ||= params[:contact_provider_mailer][:from]
        @body ||= params[:contact_provider_mailer][:body]
        ProviderMailer.with(email: @provider.email, from: @from, body: @body).new.deliver_now
    end
end