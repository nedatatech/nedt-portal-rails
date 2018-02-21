json.extract! payment, :id, :pay_date, :payment_to_from_id, :type_id, :status_id, :amount, :reason, :created_at, :updated_at
json.url payment_url(payment, format: :json)
