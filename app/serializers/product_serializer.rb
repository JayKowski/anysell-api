class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :price, :condition, :description
end
