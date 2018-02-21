class CreatePaymentToFroms < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_companies do |t|
      t.references :pay_to_id
      t.references :pay_from_id

      t.timestamps
    end
  end
end
