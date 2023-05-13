class ProductsPicture < ApplicationRecord
  belongs_to :picture
  belongs_to :product
end
