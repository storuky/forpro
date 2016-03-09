class CreateLogos < ActiveRecord::Migration
  def change
    create_table :logos do |t|
      t.string :body

      t.timestamps null: false
    end
  end
end
