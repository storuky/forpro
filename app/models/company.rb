class Company < ActiveRecord::Base
  @@current_company = nil

  has_many :positions
  has_many :users

  class <<self
    def current_company= name
      @@current_company = name
    end

    def current_company
      @@current_company
    end
  end
end
