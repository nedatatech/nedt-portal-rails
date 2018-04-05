json.extract! invoice_number, :id, :value, :created_at, :updated_at
json.url invoice_number_url(invoice_number, format: :json)
