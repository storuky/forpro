class UsersController < ApplicationController
  def create
    respond_to do |format|
      format.json {
        if !current_user && verify_captcha(params[:recaptcha])
          user = User.create
          session[:user_id] = user.id
          render json: {msg: "Вы успешно вошли в систему"}
        else
          render json: {msg: "Подтвердите, что вы не робот."}, status: 422
        end
      }
    end
  end
end
