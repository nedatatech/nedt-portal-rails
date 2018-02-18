json.extract! employee, :id, :first_name, :last_name, :username, :password_digest, :email, :phone, :street, :city, :state, :zip, :invoices_id, :owed, :payments_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
