json.extract! settings_datum, :id, :name, :type, :description, :created_at, :updated_at
json.url settings_datum_url(settings_datum, format: :json)
