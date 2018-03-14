class TruckInventory < ApplicationRecord
  belongs_to :inventory_item
  belongs_to :item_location
end
