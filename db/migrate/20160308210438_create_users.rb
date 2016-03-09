class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :company_id
      t.integer :logo_id
      t.string :name
      t.string :phone
      t.string :website
      t.string :email
      t.string :locale

      t.integer :position_ids, array: true, default: []

      t.timestamps null: false
    end
  end
end
