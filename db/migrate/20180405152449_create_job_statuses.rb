class CreateJobStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :job_statuses do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
