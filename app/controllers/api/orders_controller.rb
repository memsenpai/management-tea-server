# frozen_string_literal: true
class Api::OrdersController < Api::BaseController
  before_action :find_order, only: [:update, :destroy]

  def index
    # head :unauthorized
    render json: current_user.orders.active
  end

  def create
    order = current_user.orders.build(wrap(order_params))
    if order.save
      render json: current_user.orders
    else
      render json: {}, status: :bad_request
    end
  end

  def update
    @order.assign_attributes(wrap(order_params))
    if @order.save
      render json: current_user.orders.active
    else
      render json: {}, status: :bad_request
    end
  end

  def destroy
    if @order.destroy
      render json: current_user.orders.active
    else
      render json: {}, status: :bad_request
    end
  end

  private

  def order_params
    params.permit(:table, order_items_attributes: [:quantity, :item_id])
  end

  def find_order
    @order = current_user.orders.active.find_by_id(params[:id])
  end

  def wrap(data)
    return data if data[:order_items_attributes].blank?
    data[:order_items_attributes] = data[:order_items_attributes].group_by do |item|
      item[:item_id]
    end.map do |key, values|
      id = values.find{|value| value[:id].present? }.try(:[], :id)
      new_value = {
        item_id: key,
        quantity: values.reduce(0) { |acc, item| acc += item[:quantity] }
      }
      new_value[:id] = id if id.present?
      new_value
    end
    data
  end
end
