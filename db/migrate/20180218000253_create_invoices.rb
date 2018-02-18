class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.string :invoice_num
      t.references :techs_on_job, foreign_key: true
      t.references :customer, foreign_key: true
      t.datetime :start_job
      t.datetime :end_job
      t.integer :hours
      t.references :parts_used, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
