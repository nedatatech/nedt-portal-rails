class Company < ApplicationRecord
  has_many :payment_to_froms
  has_many :payments, as: :payment_to_froms

  def select_data  	
    pay_to = {id: self.id, type: "Company"}
  end
end
