class EmployeeTask < ApplicationRecord
  belongs_to :employee
  belongs_to :status
  belongs_to :task_type
end
