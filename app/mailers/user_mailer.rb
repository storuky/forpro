class UserMailer < ApplicationMailer
  def restore email, link
    @link = link
    mail(subject: "Данные по восстановлению", to: email)
  end
end
