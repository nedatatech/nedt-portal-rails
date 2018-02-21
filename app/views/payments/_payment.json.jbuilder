json.extract! payment, :id, :pay_to_id, :pay_to_type, :created_at, :updated_at
json.url payment_url(payment, format: :json)
