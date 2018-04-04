class InStockItem < ApplicationRecord
  belongs_to :item_location  
  belongs_to :inventory_item
end
