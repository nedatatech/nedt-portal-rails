class CreateStatusData < ActiveRecord::Migration[5.1]
  def change
    create_table :status_data do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
