class AddCityAndUserToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :city, :string
    add_column :positions, :user_id, :integer
  end

  def self.up
    User.find_each {|user| user.update(position_ids: user[:position_ids]) rescue ap "Пользователь не найден #{user.email}"}
  end
end
