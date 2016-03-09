class Category < ActiveRecord::Base
  include Companiable
  include Cacheable

  has_many :positions
  has_many :products
end
