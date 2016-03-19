class UserMailer < ApplicationMailer
  def restore email, link
    @link = link
    mail(subject: "Данные по восстановлению", to: email)
  end

  def write email, subject, body
    @body = body
    mail(subject: subject, to: email)
  end
end
