class CreateItemShops < ActiveRecord::Migration[5.2]
  def change
    create_table :item_shops do |t|
      t.string :name
      t.string :city
      t.boolean :open, null: false, default: false
      t.integer :num_employees

      t.timestamps
    end
  end
end
