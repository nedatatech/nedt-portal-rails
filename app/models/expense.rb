class Expense < ApplicationRecord
  belongs_to :owner
  belongs_to :pay_to
  belongs_to :pay_from
  belongs_to :status
end
