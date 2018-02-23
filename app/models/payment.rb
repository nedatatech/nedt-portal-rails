class Payment < ApplicationRecord
  belongs_to :pay_to, polymorphic: true, optional: true
  belongs_to :pay_from, polymorphic: true, optional: true
  #accepts_nested_attributes_for :employee
  def fullname
  	byebug
  	payment.name
  end
end
