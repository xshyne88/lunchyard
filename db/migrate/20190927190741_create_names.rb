class CreateNames < ActiveRecord::Migration[6.0]
  def change
    create_table :names do |t|
      t.string :description
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
