class CreateInventoryItems < ActiveRecord::Migration[5.1]
  def change
    create_table :inventory_items do |t|
      t.references :item_type, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :cost
      t.decimal :retail
      t.decimal :markup
      t.decimal :price

      t.timestamps
    end
  end
end
