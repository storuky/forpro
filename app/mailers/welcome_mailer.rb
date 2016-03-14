class WelcomeMailer < ApplicationMailer
  def agrofor email
    mail(subject: "Приглашаем к сотрудничеству", to: email)
  end

  def woodfor email
    mail(subject: "Приглашаем к сотрудничеству", to: email)
  end

  def fuelfor email
    mail(subject: "Приглашаем к сотрудничеству", to: email)
  end
end
