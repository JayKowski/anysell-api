class Product < ApplicationRecord
    has_many :pictures, dependent: :destroy
    has_many :products_tag, dependent: :destroy
    has_many :products_feature, dependent: :destroy
    has_many :tags, class_name: 'Tag', through: :products_tag, dependent: :destroy
    has_many :features, class_name: 'Feature',through: :products_feature, dependent: :destroy

    before_destroy lambda { |product| delete_product_children(product) }

    # S C O P E S
    scope :child_pictures, -> (product_id) { joins(:pictures).where(pictures: { product_id: product_id }) } 
    scope :child_tags, -> (product_id) { joins(:products_tag).where(products_tag: { product_id: product_id }) }
    scope :child_features, -> (product_id) { joins(:products_feature).where(products_feature: { product_id: product_id }) }

    def self.create_product(product_obj, user)
        @product = { **product_obj["attributes"].as_json, "user_id" => user.id }
        @product = Product.create!(@product)

        if @product
            @tags = Tag.create_tags(product_obj["tags"])
            if @tags[0]
                @features = Feature.create_features(product_obj["features"])
                if @features[0]
                    @pictures = Picture.create_pictures(product_obj["pictures"], @product)
                    if @pictures[0]
                        @features_assoc = ProductsFeature.create_assocs(@product, @features[1])
                        @tags_assoc = ProductsTag.create_assocs(@product, @tags[1])
                        return {
                            product: {
                                attributes: @product,
                                tags: @tags[1],
                                features: @features[1],
                                pictures: @pictures[1]
                            }
                        }
                    end
                end
            end
        end
    end

    def self.all_products
        @products = Product.all
        @final_products = []

        @products.each do |prod|
            @final_products << fetch_product_attachments(prod)
        end
        @final_products
    end

    def self.show_product(id)
        begin
            @product = Product.find(id)
            return fetch_product_attachments(@product)
        rescue ActiveRecord::RecordNotFound => e
            return nil            
        end
    end


    private
    
    def delete_product_children(product)
        @child_pictures = Product.child_pictures(product.id)
        @child_tags = Product.child_tags(product.id)
        @child_features = Product.child_features(product.id)

        @child_pictures.destroy_all
        @child_tags.destroy_all
        @child_features.destroy_all
 
    end

    def self.fetch_product_attachments(product)
        @product_obj = Hash.new

        @tags = Product.child_tags(product.id)
        @features = Product.child_features(product.id)
        @pictures = Product.child_pictures(product.id)

        @product_obj.merge!({attributes: product}).merge!({tags: @tags}).merge!({features: @features}).merge!({pictures: @pictures})
    end
end
