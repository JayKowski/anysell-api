class Tag < ApplicationRecord
    has_many :products_tag
    has_many :products, class_name: 'Product', through: :products_tag

    def self.create_tags(tags)
        @tags = []
        tags.each do |t|
            @new_tag = Tag.create!({name: t})
            @new_tag && @tags << @new_tag
        end
        
        if @tags.length == tags.length
            return [true, @tags]
        else 
            return [false, @tags]
        end
    end
end
