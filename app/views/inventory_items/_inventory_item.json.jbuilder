json.extract! inventory_item, :id, :item_brand_id, :item_type_id, :item_location_id, :item_size_id, :item_status_id, :item_notes, :cost, :retail, :markup, :price, :created_at, :updated_at
json.url inventory_item_url(inventory_item, format: :json)
