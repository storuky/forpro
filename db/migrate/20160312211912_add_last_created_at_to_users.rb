class AddLastCreatedAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_created_at, :datetime
  end
end
