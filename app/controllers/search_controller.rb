class SearchController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json {
        @positions = Position.look_for(params[:query])

        render json: @positions.pluck_fields
      }
    end
  end
end
