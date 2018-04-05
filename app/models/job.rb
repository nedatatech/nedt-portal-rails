class Job < ApplicationRecord
  belongs_to :invoice
  belongs_to :job_status
  belongs_to :customer
end
