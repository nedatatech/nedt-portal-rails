json.extract! invoice, :id, :number, :date, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
