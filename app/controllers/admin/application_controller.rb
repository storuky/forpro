class Admin::ApplicationController < ApplicationController
  before_action :check_admin

  layout proc {
    if request.xhr?
      false
    else
      set_gon
      'admin'
    end
  }

  private
    def check_admin
      if !current_user || !current_user.admin?
        raise ActionController::RoutingError.new('Not Found')
      end
    end
end
