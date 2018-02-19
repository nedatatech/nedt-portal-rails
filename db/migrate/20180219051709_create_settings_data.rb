class CreateSettingsData < ActiveRecord::Migration[5.1]
  def change
    create_table :settings_data do |t|
      t.string :name
      t.references :type
      t.text :description

      t.timestamps
    end
  end
end
