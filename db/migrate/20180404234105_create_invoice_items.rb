class CreateInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_items do |t|
      t.references :invoice, foreign_key: true
      t.references :inventory_item, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
