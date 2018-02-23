class CreateEmployeeTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_tasks do |t|
      t.references :employee, foreign_key: true
      t.references :task_type, foreign_key: true
      t.string :description      
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
