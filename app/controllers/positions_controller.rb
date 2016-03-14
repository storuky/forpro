class PositionsController < ApplicationController
  before_action :set_position, only: [:show, :edit, :destroy, :update, :touch]
  before_action :check_permission, only: [:update, :destroy, :edit]
  before_action :check_user, only: [:update, :destroy, :create]

  def index
    respond_to do |format|
      format.html
      format.json {
        if current_user
          @positions = current_user.positions
        else
          @positions = []
        end
        render json: @positions
      }
    end
  end

  def create
    respond_to do |format|
      format.json {
        if current_user.last_created_at && (Time.now - current_user.last_created_at.to_time)/1.minute < 1
          return render json: {msg: "Нельзя создавать позиции чаще 1 раза в минуту. Осталось #{60 - ((Time.now - current_user.last_created_at.to_time)/1.second).to_i} секунд"}, status: 422
        end

        @position = Position.new(position_params)
        if @position.save
          current_user.update(user_params.merge({
            position_ids: (current_user.position_ids << @position.id),
            last_created_at: DateTime.now
          }))
          render json: {msg: "Позиция успешно создана", redirect_to: "position_path", current_user: current_user.public_fields, redirect_options: {id: @position.id}, position: @position}
        else
          render json: {msg: "Не все поля формы заполнены верно", errors: @position.errors}, status: 422
        end
      }
    end
  end

  def update
    respond_to do |format|
      format.html
      format.json {
        if @position.update(position_params)
          current_user.update(user_params)
          render json: {msg: "Позиция успешно обновлена", redirect_to: "position_path", redirect_options: {id: @position.id}, position: @position}
        else
          render json: {msg: "Не все поля формы заполнены верно", errors: @position.errors}, status: 422
        end
      }
    end
  end

  def new
    respond_to do |format|
      format.html
      format.json {
        @position = Position.new
        @position.email = nil
        render json: @position
      }
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.json {
        render json: @position
      }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json {
        render json: @position
      }
    end
  end

  def destroy
    respond_to do |format|
      format.json {
        @position.destroy
        render json: {msg: "Позиция успешно удалена"}
      }
    end
  end

  def touch
    respond_to do |format|
      format.json {
        if (Time.now - @position.updated_at.to_time)/1.hour >= 1
          @position.touch
          render json: {msg: "Позиция успешно поднята", updated_at: @position.updated_at}
        else
          render json: {msg: "Позицию можно поднимать не чаще чем 1 раз в час"}, status: 422
        end
      }
    end
  end

  private
    def position_params
      params.require(:position).permit(
        :name, :email, :phone, :website,
        :trade_type, :product_id, :title,
        :weight, :weight_dimension_id, :min_weight, :min_weight_dimension_id,
        :price, :price_weight_dimension_id, :currency_id,
        :lat, :lng, :address, :description, :color
      ).merge({
        user_id: current_user.id,
        logo_id: (params[:position][:logo][:id] rescue nil),
        image_ids: (params[:position][:images].map {|image| image[:id]} rescue nil),
        document_ids: (params[:position][:documents].map {|document| document[:id]} rescue nil)
      })
    end

    def user_params
      params.require(:position).permit(:phone, :email, :name, :website).merge({
        logo_id: (params[:position][:logo][:id] rescue nil)
      })
    end

    def set_position
      @position = Position.find(params[:id])
    end

    def check_permission
      if current_user.position_ids.exclude?(@position.id)
        respond_to do |format|
          format.html {
            redirect_to position_path(@position)
          }
          format.json {
            render json: {msg: "Нет прав для выполнения данного действия"}, status: 422 
          }
        end
      end
    end

    def check_user
      if !current_user
        render json: {msg: "Вы не авторизованы", reload: true}, status: 422
      end
    end
end
