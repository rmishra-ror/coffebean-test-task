class NotifierMailer < ApplicationMailer
  default from: Rails.application.credentials.dig(:mailer, :default_from_email)

  def email
    mail(to: params[:email], subject: "Notify")
  end
end
