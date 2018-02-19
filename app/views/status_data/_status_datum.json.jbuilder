json.extract! status_datum, :id, :name, :description, :created_at, :updated_at
json.url status_datum_url(status_datum, format: :json)
