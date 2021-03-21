# frozen_string_literal: true
class Api::ItemsController < Api::BaseController
  before_action :find_item, only: [:update, :destroy]

  def index
    render json: current_user.items
  end

  def create
    item = current_user.items.new(item_params)
    if item.save
      render json: current_user.items
    else
      render json: {}, status: :bad_request
    end
  end

  def update
    @item.assign_attributes(item_params)
    if @item.save
      render json: current_user.items
    else
      render json: {}, status: :bad_request
    end
  end

  def destroy
    if @item.destroy
      render json: current_user.items
    else
      render json: {}, status: :bad_request
    end
  end

  private

  def item_params
    params.permit(:name, :price_sell, :price_buy)
  end

  def find_item
    @item = current_user.items.find_by_id()
  end
end
