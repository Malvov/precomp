class AdminMailer < ApplicationMailer
  def new
    @from = params[:from]
    @contact_email = params[:contact_email]
    @phone_number = params[:phone_number]
    @body = params[:body]

    mail to: 'jcerda@precomp.com.ni', subject: 'Nuevo mensaje de Precomp.com.ni'
  end
end