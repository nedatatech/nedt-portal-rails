class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.references :invoice, foreign_key: true
      t.date :date
      t.references :status, foreign_key:true
      t.datetime :scheduled_for
      t.datetime :completed_on
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
