# frozen_string_literal: true
class Api::BaseController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_404

  private
  def rescue_404
    return head :not_found
  end

  def set_user
    @user = User.find_by_id(params[:user_id])
    raise ActiveRecord::RecordNotFound if @user.blank?
  end
end
