class ProductsFeature < ApplicationRecord
  belongs_to :product_feature
  belongs_to :product
end
