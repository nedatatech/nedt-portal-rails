class PaymentToFrom < ApplicationRecord
  	belongs_to :image, inverse_of: :albums_images
	belongs_to :album, inverse_of: :albums_images
end
