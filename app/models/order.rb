class Order < ApplicationRecord
  belongs_to :vendor
  belongs_to :order_status
  has_many :order_items  
end
