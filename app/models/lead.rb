class Lead < ApplicationRecord
  belongs_to :lead_source
  belongs_to :lead_status
end
