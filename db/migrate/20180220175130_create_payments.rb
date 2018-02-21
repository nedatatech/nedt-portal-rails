class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.date :pay_date
      t.references :payment_to_from, foreign_key: true
      t.references :type, foreign_key: true
      t.references :status, foreign_key: true
      t.decimal :amount
      t.text :reason

      t.timestamps
    end
  end
end
