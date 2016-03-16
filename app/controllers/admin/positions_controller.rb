class Admin::PositionsController < Admin::ApplicationController
  before_action :set_position, only: [:edit, :destroy, :update, :moderate]

  def index
    respond_to do |format|
      format.html
      format.json {
        render json: dump(Position.where(status: "new"), serializer: PositionSerializer)
      }
    end
  end

  def moderate
    respond_to do |format|
      format.json {
        @position.moderate!
        render json: {msg: "Успешно прошло модерацию"}
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

  def destroy
    respond_to do |format|
      format.json {
        @position.destroy
        render json: {msg: "Успешно удалено"}
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
end
