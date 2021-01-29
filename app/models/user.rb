# frozen_string_literal: true
class User < ApplicationRecord
  has_many :sleeps, dependent: :destroy
  has_many :user_followers, class_name: "::Follow", foreign_key: :followee_id,
    dependent: :destroy
  has_many :followers, through: :user_followers, source: :follower

  has_many :user_followings, class_name: "::Follow", foreign_key: :follower_id,
    dependent: :destroy
  has_many :followings, through: :user_followings, source: :followee
end
