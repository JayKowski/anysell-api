class V1::OrdersController < ApplicationController
    def create
        @order = Order.create_order(params)
        if @order
            render json: {
                success: true,
                message: "order placed successfully",
                data: {
                    order: OrderSerializer.new(@order[:order])
                }
            }, status: :ok
        else
            render json: {
                success: false,
                message: "there was an error",
                data: nil
            }, status: :unprocessable_entity
        end
    end

    def destroy
        @order = Order.find(params[:id])
        if @order
            Order.destroy(params[:id])
            render json: {
                success: true,
                message: "order successfully deleted",
                data: nil
            }, status: :ok
        else
            render json: {
                success: false,
                message: "there was an issue deleting the order",
                data: nil
            }, status: :unprocessable_entity
        end
    end


    private

    def order_params
        params.require(:order).permit(attributes: {}, products: [])
    end
end
