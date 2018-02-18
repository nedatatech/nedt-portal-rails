class Invoice < ApplicationRecord
  belongs_to :techs_on_job
  belongs_to :customer
  belongs_to :parts_used
end
