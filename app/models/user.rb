class User < ActiveRecord::Base
  include Companiable
  @@current_user = nil

  has_many :positions

  class <<self
    def current_user= name
      @@current_user = name
    end

    def current_user
      @@current_user
    end
  end

  def public_fields
    self.attributes.slice("id", "name", "position_ids")
  end
end
