class OrderSerializer < ActiveModel::Serializer
  attributes :id, :order_status, :total_price, :payment_status
end
