# frozen_string_literal: true
class Api::V1::SleepsController < Api::BaseController
  before_action :set_user
  before_action :set_sleep, only: :update

  def index
    render json: @user.sleeps.order(created_at: :desc)
  end

  def create
    @sleep = @user.sleeps.create({start_time: Time.current}.merge(sleep_params))
    save_sleep
  end

  def update
    @sleep.assign_attributes({end_time: Time.current}.merge(sleep_params))
    save_sleep
  end

  private

  def sleep_params
    params.permit(:start_time, :end_time)
  end

  def save_sleep
    return render json: @sleep if @sleep.save
    render json: @sleep.errors, status: :bad_request
  end

  def set_user
    @user = User.find_by_id(params[:user_id])
    raise ActiveRecord::RecordNotFound if @user.blank?
  end

  def set_sleep
    @sleep = @user.sleeps.find_by_id(params[:id])
    raise ActiveRecord::RecordNotFound if @sleep.blank?
  end
end
