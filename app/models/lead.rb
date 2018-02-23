class Lead < ApplicationRecord
  belongs_to :source
  belongs_to :lead_status
end
