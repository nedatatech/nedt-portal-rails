class Customer < ApplicationRecord
  belongs_to :invoices, optional: true

  def fullname
    "#{first_name} #{last_name}"
  end
end
