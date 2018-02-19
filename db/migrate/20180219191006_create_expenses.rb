class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.references :owner, foreign_key: true
      t.boolean :recurring
      t.date :due
      t.references :pay_to, foreign_key: true
      t.references :pay_from, foreign_key: true
      t.decimal :amount
      t.references :status, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
