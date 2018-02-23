class CompanyTask < ApplicationRecord
  belongs_to :company
  belongs_to :status
  belongs_to :task_type
end
