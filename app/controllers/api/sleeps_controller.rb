# frozen_string_literal: true
class Api::V1::SleepsController < Api::BaseController
  before_action :set_user
  before_action :set_sleep, only: :update

  def index
    sleeps = @user.sleeps
    sleeps = sleeps.filter_start_time(
      filter_start_time_params.as_json.symbolize_keys
    ) if params[:filter_start_time]
    render json: sleeps.order(created_at: :desc)
  end

  def create
    @sleep = @user.sleeps.new({start_time: Time.current}.merge(sleep_params))
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

  def filter_start_time_params
    params.require(:filter_start_time).permit(:begin_start_time, :end_start_time)
  end

  def save_sleep
    return render json: @sleep if @sleep.save
    render json: @sleep.errors, status: :bad_request
  end

  def set_sleep
    @sleep = @user.sleeps.find_by_id(params[:id])
    raise ActiveRecord::RecordNotFound if @sleep.blank?
  end
end
