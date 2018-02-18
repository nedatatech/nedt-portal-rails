json.extract! invoice, :id, :invoice_num, :techs_on_job_id, :customer_id, :start_job, :end_job, :hours, :parts_used_id, :status, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
