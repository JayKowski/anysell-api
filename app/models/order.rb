class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  has_many :products, :through => :order_products

  attribute :order_status, :string, default: "pending"
  attribute :payment_status, :string, default: "pending"

  before_destroy :delete_order_attachments


  def self.create_order(body)
    @prices = body[:order][:products].map { |order| order[:price] * order[:quantity]}
    @prices_sum = @prices.sum
    @order = Order.create!({**body[:order][:attributes].as_json, "total_price" => @prices_sum})
    
    if @order
      @order_products = OrderProduct.create_order_products(body[:order][:products], @order.id)
      return { order: @order, order_items: @order_products }
    else
      return nil
    end
  end


  def delete_order_attachments
    self.order_products.destroy_all
  end
end
