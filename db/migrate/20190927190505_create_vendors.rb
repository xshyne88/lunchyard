class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :description
      t.string :address
      t.date :last_catered

      t.timestamps
    end
  end
end
