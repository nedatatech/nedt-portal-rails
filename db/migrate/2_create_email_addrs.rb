class CreateEmailAddrs < ActiveRecord::Migration[5.1]
  def change
    create_table :email_addrs do |t|
      t.string :mailbox
      t.string :domain

      t.timestamps
    end
  end
end
