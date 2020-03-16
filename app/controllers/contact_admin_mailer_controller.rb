class ContactAdminMailerController < ApplicationController
  def new
  end

  def create
    @from ||= params[:contact_admin_mailer][:from]
    @body ||= params[:contact_admin_mailer][:body]
    @contact_email ||= params[:contact_admin_mailer][:contact_email]
    @phone_number ||= params[:contact_admin_mailer][:phone_number]

    AdminMailer.with(from: @from, body: @body, contact_email: @contact_email, phone_number: @phone_number).new.deliver_now
  end
end