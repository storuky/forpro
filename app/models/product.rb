class Product < ActiveRecord::Base
  include Companiable
  include Cacheable

  has_many :positions
end
