class ContactProviderMailerController < ApplicationController
    def new
        @provider = Provider.friendly.find params[:provider_id]
    end
    def create
        @provider = Provider.friendly.find params[:provider_id]
        @from ||= params[:from]
        @body ||= params[:body]
        ProviderMailer.with(provider: @provider).new.deliver_now
    end
end