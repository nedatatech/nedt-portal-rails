class Job < ApplicationRecord
  belongs_to :invoice, optional: true
  belongs_to :customer, optional: true
end
