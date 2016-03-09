class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :filename

      t.string :body
      t.integer :position_id

      t.timestamps null: false
    end
  end
end
