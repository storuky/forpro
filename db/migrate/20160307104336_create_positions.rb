class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.boolean :delta, deafult: true

      t.text :index_field

      t.integer :company_id
      t.index :company_id

      t.integer :currency_id
      t.integer :logo_id
      t.string :name
      t.string :email
      t.string :phone
      t.string :website
      
      t.string :trade_type, default: "buy"
      t.index :trade_type

      t.string :title
      t.string :color
      
      t.integer :category_id
      t.index :category_id
      
      t.integer :product_id
      t.index :product_id
      
      t.float :weight
      t.float :weight_etalon
      t.integer :weight_dimension_id, default: 1
      
      t.float :min_weight, default: 0
      t.float :min_weight_etalon
      t.integer :min_weight_dimension_id, default: 1
      
      t.float :price
      t.float :price_etalon
      t.integer :price_weight_dimension_id, default: 1
      
      t.float :deviation, default: 0
      t.text :description
      t.float :lat
      t.float :lng
      t.string :address

      t.timestamps null: false
    end
  end
end
