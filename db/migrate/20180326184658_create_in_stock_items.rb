class CreateInStockItems < ActiveRecord::Migration[5.1]
  def change
    create_table :in_stock_items do |t|
      t.references :inventory_item, foreign_key: true, index: { unique: true }
      t.references :item_location
      t.integer :item_quantity
      t.text :notes

      t.timestamps
    end
  end
end
