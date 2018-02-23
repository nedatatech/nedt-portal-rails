class CreateLeadSources < ActiveRecord::Migration[5.1]
  def change
    create_table :lead_sources do |t|
      t.references :name, foreign_key: true
      t.references :description, foreign_key: true

      t.timestamps
    end
  end
end
