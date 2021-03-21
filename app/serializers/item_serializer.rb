# frozen_string_literal: true
class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price_sell, :price_buy
end
