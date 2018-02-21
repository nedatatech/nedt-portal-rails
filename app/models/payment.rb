class Payment < ApplicationRecord
  has_many :payment_to_froms
  has_many :companies, through: :payment_to_froms
  accepts_nested_attributes_for :companies

end
