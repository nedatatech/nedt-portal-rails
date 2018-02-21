class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.references :pay_to, polymorphic: true

      t.timestamps
    end
  end
end
