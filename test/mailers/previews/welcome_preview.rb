# Preview all emails at http://localhost:3000/rails/mailers/welcome
class WelcomePreview < ActionMailer::Preview
  def agrofor
    WelcomeMailer.agrofor("storuky@gmail.com")
  end

  def woodfor
    WelcomeMailer.woodfor("storuky@gmail.com")
  end
end
