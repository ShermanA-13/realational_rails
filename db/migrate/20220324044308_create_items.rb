class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :item_shop, foreign_key: true
      t.string :name
      t.integer :quantity
      t.float :price
      t.boolean :consumable, null: false, default: false

      t.timestamps
    end
  end
end
