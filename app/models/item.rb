# frozen_string_literal: true
class Item < ApplicationRecord
  acts_as_paranoid

  belongs_to :user

  has_many :order_items, foreign_key: :item_id
  has_many :orders, through: :order_items
end
