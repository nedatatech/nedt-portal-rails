json.extract! in_stock_item, :id, :inventory_item_id, :item_location, :item_quantity, :notes, :created_at, :updated_at
json.url in_stock_item_url(in_stock_item, format: :json)
