json.extract! expense, :id, :owner_id, :recurring, :due, :pay_to_id, :pay_from_id, :amount, :status_id, :description, :created_at, :updated_at
json.url expense_url(expense, format: :json)
