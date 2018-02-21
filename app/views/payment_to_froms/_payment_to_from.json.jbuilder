json.extract! payment_to_from, :id, :pay_to_id, :pay_to_type, :pay_from_id, :pay_from_type, :created_at, :updated_at
json.url payment_to_from_url(payment_to_from, format: :json)
