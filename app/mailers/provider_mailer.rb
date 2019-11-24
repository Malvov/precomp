class ProviderMailer < ApplicationMailer
    def new
        @email = params[:email]
        @text = 'text'

        mail to: @email, subject: 'You\'ve got new email'
    end
end
