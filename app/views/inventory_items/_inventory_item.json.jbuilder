json.extract! inventory_item, :id, :item_type_id, :name, :description, :cost, :retail, :markup, :price, :created_at, :updated_at
json.url inventory_item_url(inventory_item, format: :json)
