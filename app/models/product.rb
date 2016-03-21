class Product < ActiveRecord::Base
  include Companiable
  include Cacheable

  has_many :positions
  belongs_to :category
end
