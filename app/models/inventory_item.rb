class InventoryItem < ApplicationRecord
  belongs_to :item_brand
  belongs_to :item_type  
  belongs_to :item_size
  has_many :order_items

  def name
    "#{item_type.name} #{item_size.name}"
  end 

  #def location
 # 	case item_status.id
  #	  when 2, 3
   #     "#{item_location.name}"
   #   else
   #     "#{item_location.name} #{item_location.truck.name}"
   # end
  #end 
end
