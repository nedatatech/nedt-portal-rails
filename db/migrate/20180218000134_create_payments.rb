class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.date :pay_date
      t.references :paid_to, foreign_key: true
      t.string :payment_type

      t.timestamps
    end
  end
end
