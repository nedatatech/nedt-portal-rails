class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.date :date
      t.references :vendor, foreign_key: true
      t.references :order_status, foreign_key: true

      t.timestamps
    end
  end
end
