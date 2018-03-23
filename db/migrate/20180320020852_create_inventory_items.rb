class CreateInventoryItems < ActiveRecord::Migration[5.1]
  def change
    create_table :inventory_items do |t|
      t.references :item_brand, foreign_key: true
      t.references :item_type, foreign_key: true
      t.references :item_location, foreign_key: true
      t.references :item_size, foreign_key: true
      t.references :item_status, foreign_key: true
      t.text :item_notes
      t.decimal :cost
      t.decimal :retail
      t.decimal :markup
      t.decimal :price

      t.timestamps
    end
  end
end
