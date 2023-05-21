class ProductsTag < ApplicationRecord
  belongs_to :tag, class_name: "Tag"
  belongs_to :product, class_name: "Product"

  def self.create_assocs(product, tags)
    @created_tags = []
    
    tags.each do |t|
      @product_tag = ProductsTag.create!({ tag_id: t.id, product_id: product.id })
      @product_tag && @created_tags << @product_tag
    end

    if @created_tags.length == tags.length
      return [true, @created_tags]
    else
      return [false, @created_tags]
    end
  end

end
