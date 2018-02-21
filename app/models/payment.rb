class Payment < ApplicationRecord
  belongs_to :pay_to, polymorphic: true, optional: true
  #accepts_nested_attributes_for :employee
end
