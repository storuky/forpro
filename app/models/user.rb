class User < ActiveRecord::Base
  include Companiable
  @@current_user = nil

  class <<self
    def current_user= name
      @@current_user = name
    end

    def current_user
      @@current_user
    end
  end
end
