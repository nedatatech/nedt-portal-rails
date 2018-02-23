json.extract! lead_source, :id, :name_id, :description_id, :created_at, :updated_at
json.url lead_source_url(lead_source, format: :json)
