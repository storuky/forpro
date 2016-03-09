class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :company_id
      t.index :company_id
      
      t.string :title
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
