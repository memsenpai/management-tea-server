# frozen_string_literal: true
class FollowSerializer < ActiveModel::Serializer
  belongs_to :follower, serializer: UserSerializer
  belongs_to :followee, serializer: UserSerializer

  attributes :id
end
