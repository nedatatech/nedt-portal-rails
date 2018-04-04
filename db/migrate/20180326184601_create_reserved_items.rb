class CreateReservedItems < ActiveRecord::Migration[5.1]
  def change
    create_table :reserved_items do |t|
      t.references :job, foreign_key: true
      t.references :inventory_item, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
