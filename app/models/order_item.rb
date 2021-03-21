# frozen_string_literal: true
class OrderItem < ApplicationRecord
  acts_as_paranoid

  belongs_to :item, inverse_of: :order_items
  belongs_to :order, inverse_of: :order_items

  before_save :calculate_price
  private

  def calculate_price
    self.price_sell = item.price_sell * quantity
  end
end
