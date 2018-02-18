json.extract! payment, :id, :pay_date, :paid_to_id, :payment_type, :created_at, :updated_at
json.url payment_url(payment, format: :json)
