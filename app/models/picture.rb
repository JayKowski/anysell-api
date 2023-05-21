class Picture < ApplicationRecord
    belongs_to :product

    def self.create_pictures(pictures, product)
        @pictures = []

        # CLOUDINARY UPLOADS FIRST, then get links!
        pictures.each do |p|
            @picture = Picture.create!({ link_url: p[0], caption: p[1], product_id: product.id })
            @picture && @pictures << @picture
        end

        if @pictures.length == pictures.length
            return [true, @pictures]
        else
            return [false, @pictures]
        end
    end
end
