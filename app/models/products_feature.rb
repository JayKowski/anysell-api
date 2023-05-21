class ProductsFeature < ApplicationRecord
  belongs_to :feature, class_name: 'Feature' #, through: :products_features
  belongs_to :product, class_name: 'Product' #, through: :products_features

  def self.create_assocs(product, features)
    @products_features = []

    features.each do |f|
      @product_feature = ProductsFeature.create!({feature_id: f.id, product_id: product.id})
      @product_feature && @products_features << @product_feature
    end

    if @products_features.length == features.length 
      return [true, @products_features]
    else
      return [false, @products_features]
    end
  end
end
