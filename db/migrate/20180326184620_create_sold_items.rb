class CreateSoldItems < ActiveRecord::Migration[5.1]
  def change
    create_table :sold_items do |t|
      t.references :inventory_item, foreign_key: true
      t.references :invoice, foreign_key: true
      t.string :price
      t.string :money
      t.text :notes

      t.timestamps
    end
  end
end
