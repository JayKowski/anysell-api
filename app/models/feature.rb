class Feature < ApplicationRecord
  has_many :products_feature
  has_many :products, class_name: 'Product', through: :products_feature

    def self.create_features(features)
        @features = []
    
        features.each do |f|
          @feature = Feature.create!({ feature_name: f[0], feature_value: f[1]})
          @feature && @features << @feature
        end
    
        if @features.length == features.length
          return [true, @features]
        else
          return [false, @features]
        end
      end
end
