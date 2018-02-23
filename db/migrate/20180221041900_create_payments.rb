class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table   :payments do |t|
      t.date       :date
      t.references :pay_to, polymorphic: true
      t.references :pay_from, polymorphic: true
      t.decimal    :amount
      t.text       :reason
      t.timestamps
    end
  end
end
