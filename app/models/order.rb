# frozen_string_literal: true
class Order < ApplicationRecord
  acts_as_paranoid

  before_destroy :can_not_destroy_done

  belongs_to :user

  has_many :order_items, foreign_key: :order_id, dependent: :destroy, inverse_of: :order
  has_many :items, through: :order_items

  accepts_nested_attributes_for :order_items
  validates :table, uniqueness: { scope: :user_id }
  enum status: {
    active: 0,
    done: 1,
  }

  private

  def can_not_destroy_done
    return unless done?
    errors.add_to_base("Can not destroy order has been done")
    return false
  end
end
