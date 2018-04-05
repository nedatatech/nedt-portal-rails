json.extract! job, :id, :invoice_id, :date, :job_status_id, :scheduled_for, :completed_on, :customer_id, :created_at, :updated_at
json.url job_url(job, format: :json)
