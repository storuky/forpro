class UsersController < ApplicationController
  def create
    respond_to do |format|
      format.json {
        if !current_user && verify_captcha(params[:recaptcha])
          user = User.create
          session[:user_id] = user.id
          render json: {msg: "Вы успешно вошли в систему", current_user: user}
        else
          render json: {msg: "Подтвердите, что вы не робот."}, status: 422
        end
      }
    end
  end

  def confirm
    if params[:auth]
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
      email = crypt.decrypt_and_verify(params[:auth])
      Position.where(email: email).update_all(user_id: current_user.id)
      redirect_to positions_path
    end
  end

  def restore
    if current_user.last_restore_date && (DateTime.now - 1.minute < current_user.last_restore_date)
      return render json: {msg: "Восстанавливать доступ можно не чаще 1 раза в минуту"}, status: 422
    end
    if params[:email]
      position_count = Position.where(email: params[:email]).count
      if position_count != 0
        crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
        encrypted_data = crypt.encrypt_and_sign(params[:email])

        UserMailer.delay.restore(params[:email], "https://#{current_company.name}.pro/users/confirm?auth=#{encrypted_data}")
        current_user.update(last_restore_date: DateTime.now)
        render json: {
          msg: "Вам было отправлено письмо с данными по восстановлению доступа"
        }
      else
        render json: {
          msg: "Позиции с данным email не найдены"
        }, status: 422
      end
    else
      render json: {
        msg: "Неверно указан email"
      }, status: 422
    end
  end

  def enter
    if params[:auth]
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
      email = crypt.decrypt_and_verify(params[:auth])
      user = User.where(email: email).last
      if user
        session[:user_id] = user.id
      end
      redirect_to root_path
    end
  end
end
