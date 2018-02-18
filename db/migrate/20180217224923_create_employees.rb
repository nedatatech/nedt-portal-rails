class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password_digest
      t.string :salt
      t.string :email
      t.string :phone
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.references :invoices, foreign_key: true
      t.integer :owed
      t.references :payments, foreign_key: true

      t.timestamps
    end
  end
end
