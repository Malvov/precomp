class ProviderMailer < ApplicationMailer
    def new
        @email = params[:email]
        @from = params[:from]
        @body = params[:body]

        mail to: @email, subject: 'You\'ve got new email'
    end
end
