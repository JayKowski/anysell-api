class V1::ProductsController < ApplicationController
    def index
    end

    def create
        # @product = Product.create!()
    end

    def update
    end

    def delete
    end


    private

    def product_params
        params.require(:product).permit(:name, :category, :price, :condition, :description)
    end
end
