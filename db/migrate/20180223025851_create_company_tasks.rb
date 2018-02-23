class CreateCompanyTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :company_tasks do |t|
      t.references :company, foreign_key: true
      t.references :task_type, foreign_key: true
      t.text :description
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
