json.extract! company_task, :id, :owner_id, :description, :status, :created_at, :updated_at
json.url company_task_url(company_task, format: :json)
