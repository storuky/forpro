class AddStatusToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :status, :string, default: "new"
  end
end
