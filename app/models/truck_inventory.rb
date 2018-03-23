class TruckInventory < ApplicationRecord
  belongs_to :truck
  belongs_to :inventory_item
end
