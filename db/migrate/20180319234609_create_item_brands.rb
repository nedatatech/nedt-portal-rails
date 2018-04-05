class CreateItemBrands < ActiveRecord::Migration[5.1]
  def change
    create_table :item_brands do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
