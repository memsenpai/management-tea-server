# frozen_string_literal: true
class Sleep < ApplicationRecord
  belongs_to :user

  scope :filter_start_time, -> (
    begin_start_time: Time.current.last_week.beginning_of_week,
    end_start_time: Time.current.last_week.end_of_week
  ) {
    where(start_time: [begin_start_time..end_start_time])
  }
end
