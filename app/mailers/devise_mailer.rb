class DeviseMailer < Devise::Mailer
    default template_path: 'devise/mailer'

    def confirmation_instructions record, token, opts = {}
        @name = record.name
        super
    end
end