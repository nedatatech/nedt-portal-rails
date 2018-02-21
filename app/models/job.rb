class Job < ApplicationRecord
  belongs_to :invoice, optional: true
  belongs_to :customer, optional: true
  belongs_to :status, optional: true
end
