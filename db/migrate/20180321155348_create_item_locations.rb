class CreateItemLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :item_locations do |t|
      t.references :truck, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
