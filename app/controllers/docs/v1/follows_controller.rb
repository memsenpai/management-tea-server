# frozen_string_literal: true
class Docs::V1::FollowsController < Docs::BaseController
  swagger_path "/users/{user_id}/follows?type={type}" do
    operation :get do
      key :summary, "Get followers/followings"
      key :description, "Returns list of followers/followings of user"
      key :operationId, "getFollows"
      key :tags, [
        "user_follows",
      ]
      parameter name: :user_id, in: :path, description: "ID of user", required: true, type: :integer
      parameter name: :type, description: "'followers' or 'followees'", required: true, type: :string
    end
  end

  swagger_path "/users/{user_id}/follows" do
    operation :post do
      key :summary, "Follow a user"
      key :operationId, "createFollow"
      key :tags, [
        "user_follow",
      ]
      parameter name: :user_id, in: :path, description: "ID of user", required: true, type: :integer
      parameter name: :type, description: "'user_followers' or 'user_followings'", required: true, type: :string
      parameter name: :user_id, description: "ID of follower", required: true, type: :string
      parameter name: :user_id, description: "ID of followee", required: true, type: :string
    end
  end

  swagger_path "/users/{user_id}/follows/{id}" do
    operation :delete do
      key :summary, "unFollow a user"
      key :operationId, "deleteFollow"
      key :tags, [
        "user_unfollow",
      ]
      parameter name: :user_id, in: :path, description: "ID of user", required: true, type: :integer
      parameter name: :id, in: :path, description: "ID of follow", required: true, type: :integer
    end
  end
end
