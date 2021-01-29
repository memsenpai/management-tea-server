# frozen_string_literal: true
class SleepSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time
end
