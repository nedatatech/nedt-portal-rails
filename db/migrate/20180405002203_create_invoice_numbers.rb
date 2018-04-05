class CreateInvoiceNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_numbers do |t|
      t.integer :value

      t.timestamps
    end
  end
end
