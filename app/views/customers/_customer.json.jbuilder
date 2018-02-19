json.extract! customer, :id, :first_name, :last_name, :email, :phone, :street, :city, :state, :zip, :invoices_id, :created_at, :updated_at
json.url customer_url(customer, format: :json)
