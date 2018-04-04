json.extract! sold_item, :id, :inventory_item_id, :invoice_id, :price, :money, :notes, :created_at, :updated_at
json.url sold_item_url(sold_item, format: :json)
