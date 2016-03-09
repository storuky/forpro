class UsersController < ApplicationController
  def locale
    respond_to do |format|
      format.json {
        if ["ru", "en"].include?(params["locale"])
          if current_user
            current_user.update(locale: params["locale"])
          end
          
          session[:locale] = params["locale"]
          render json: {reload: true}
        else
          render json: {msg: "Такого языка нет в системе"}, status: 422
        end
      }
    end
  end
end
