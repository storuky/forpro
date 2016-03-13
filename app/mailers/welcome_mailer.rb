class WelcomeMailer < ApplicationMailer
  def agrofor email
    mail(subject: "Приглашаем к сотрудничеству", to: email)
  end
end
