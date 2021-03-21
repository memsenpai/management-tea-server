# frozen_string_literal: true
class OrderSerializer < ActiveModel::Serializer
  attributes :id, :table, :items

  def items
    object.order_items.map do |order_item|
      {
        id: order_item.id,
        name: order_item.item.name,
        quantity: order_item.quantity,
        price: order_item.price_sell
      }
    end
  end
end
