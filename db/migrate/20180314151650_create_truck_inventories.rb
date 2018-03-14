class CreateTruckInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :truck_inventories do |t|
      t.references :inventory_item, foreign_key: true
      t.references :item_location, foreign_key: true

      t.timestamps
    end
  end
end
