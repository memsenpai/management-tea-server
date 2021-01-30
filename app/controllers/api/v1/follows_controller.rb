# frozen_string_literal: true
class Api::V1::FollowsController < Api::BaseController
  before_action :set_user
  before_action :verify_type, only: [:index, :create]
  before_action :set_follow, only: :destroy

  def index
    render json: @user.send(params[:type])
  end

  def create
    follow = @user.send(params[:type]).new({follower_id: params[:user_id]}.merge(follow_params))
    return render json: follow if follow.save
    render json: follow.errors, status: :bad_request
  end

  def destroy
    return render json: @follow if @follow.destroy
    render json: @follow.errors, status: :bad_request
  end

  private
  def follow_params
    params.permit(:followee_id)
  end

  def index_types
    ["followers", "followings"]
  end

  def create_types
    ["user_followers", "user_followings"]
  end

  def verify_type
    return render(
      json: { message: "Wrong type" },
      status: :bad_request
    ) unless send("#{params[:action]}_types").include?(params[:type])
  end

  def set_follow
    @follow = Follow.find_by_id(params[:id])
    raise ActiveRecord::RecordNotFound if @follow.blank?
  end
end
