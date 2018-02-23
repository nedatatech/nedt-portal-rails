class CreateLeadStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :lead_statuses do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
