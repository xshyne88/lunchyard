class CreateLunchDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :lunch_dishes, id: false do |t|
      t.references :lunch, null: false, foreign_key: true
      t.references :dish, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
