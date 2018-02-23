json.extract! employee_task, :id, :owner_id, :description, :status_id, :created_at, :updated_at
json.url employee_task_url(employee_task, format: :json)
