json.extract! truck_inventory, :id, :inventory_item_id, :item_location_id, :created_at, :updated_at
json.url truck_inventory_url(truck_inventory, format: :json)
