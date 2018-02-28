class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password_digest
      t.string :salt
      t.references :email_addr, foreign_key: true

      t.timestamps
    end
  end
end
