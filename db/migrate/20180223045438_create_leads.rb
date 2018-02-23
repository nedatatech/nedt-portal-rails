class CreateLeads < ActiveRecord::Migration[5.1]
  def change
    create_table :leads do |t|
      t.date :date
      t.references :source, foreign_key: true
      t.decimal :cost
      t.references :lead_status, foreign_key: true

      t.timestamps
    end
  end
end
