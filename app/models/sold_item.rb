class SoldItem < ApplicationRecord
  belongs_to :inventory_item
  belongs_to :invoice
end
