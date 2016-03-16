class Admin::HomeController < Admin::ApplicationController

  def stats
    render json: {
      users_count: User.all.count,
      new_positions_count: Position.where(status: "new").count,
      positions_count: Position.all.count
    }
  end
end
