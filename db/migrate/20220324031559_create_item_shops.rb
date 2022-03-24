class CreateItemShops < ActiveRecord::Migration[5.2]
  def change
    create_table :item_shops do |t|
      t.string :name
      t.string :city/village
      t.boolean :open
      t.integer :num_employees

      t.timestamps
    end
  end
end
