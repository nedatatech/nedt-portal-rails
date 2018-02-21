json.extract! payment, :id, :pay_date, :paid_to_id, :paid_from_id, :pay_type_id, :status_id, :amount, :reason, :created_at, :updated_at
json.url payment_url(payment, format: :json)
