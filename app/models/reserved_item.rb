class ReservedItem < ApplicationRecord
  belongs_to :job
  belongs_to :inventory_item
end
