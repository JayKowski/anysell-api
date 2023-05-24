class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  # set default order quantity to 1
  attribute :quantity, :integer, default: 1

  def self.create_order_products(products, order_id)
    @order_products = []

    products.each do |product|
      @order_product = OrderProduct.create!(product_id: product[:id], order_id: order_id, quantity: product[:quantity])
      @order_product && @order_products << @order_product
    end

    @order_products
  end
end
