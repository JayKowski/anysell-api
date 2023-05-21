class V1::ProductsController < ApplicationController
    def index
        @products = Product.all_products
        render json: {
            success: true,
            message: "all store products",
            data: @products
        }, status: :ok
    end

    def show
        @product = Product.show_product(params[:id])
        if @product
            render json: {
                success: true,
                message: "product details",
                data: @product
            }, status: :ok
        else
            render json: {
                success: false,
                message: "product not found",
                data: nil,
            }, status: :not_found
        end
    end

    def create
        @product = Product.create_product(params["product"], current_user)
        render json: {
            success: true,
            message: "product added successfully",
            data: @product
        }, status: :ok
    end

    def update
    end

    def destroy
        @product = Product.destroy(params[:id])
        if @product
            render json: {
                success: true,
                message: "product siccessfully deleted",
                data: nil
            }, status: :ok
        else
            render json: {
                success:false,
                message: "an error occured while deleting the product",
                data: nil
            }, status: @product.errors.status
        end
    end


    private

    def product_params
        params.require(:product).permit(attributes: {}, tags: [], features: [], pictures: [])
    end
end
