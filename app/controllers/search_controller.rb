class SearchController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json {
        @positions = Position.look_for(params[:query])

        tags = params[:tags].try(:values)
        if tags.try(:any?)
          @positions = @positions.filter tags
        end

        render json: Oj.dump(@positions.pluck_fields)
      }
    end
  end
end
