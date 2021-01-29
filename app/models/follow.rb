# frozen_string_literal: true
class Follow < ApplicationRecord
  belongs_to :follower, class_name: "::User"
  belongs_to :followee, class_name: "::User"

  validate :can_not_follow_themselves
  validates :followee_id, uniqueness: {
    scope: :follower_id,
    message: "You has been follow this user"
  }

  private

  def can_not_follow_themselves
    errors.add(:base, "You can not follow themselves") if follower_id == followee_id
  end
end
