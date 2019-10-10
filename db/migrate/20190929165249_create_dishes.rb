class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.bigint :price
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
