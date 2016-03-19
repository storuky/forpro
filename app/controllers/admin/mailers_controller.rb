class Admin::MailersController < Admin::ApplicationController
  def index
  end

  def create
    respond_to do |format|
      format.json {
        if params[:email].present? && params[:subject].present? && params[:body].present?
          UserMailer.delay.write(params[:email], params[:subject], params[:body])
          render json: {msg: "Отправлено"}
        else
          render json: {msg: "Не все поля заполнены"}
        end
      }
    end
  end
end
