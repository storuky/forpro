class AddLastRestoreDateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_restore_date, :datetime
  end
end
