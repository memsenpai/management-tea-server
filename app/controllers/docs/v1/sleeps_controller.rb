# frozen_string_literal: true
class Docs::V1::SleepsController < Docs::BaseController
  swagger_path "/users/{user_id}/sleeps" do
    operation :get do
      key :summary, "Get all sleeps"
      key :description, "Returns all sleeps of user"
      key :operationId, "getSleeps"
      key :tags, [
        "user_sleeps",
      ]
      parameter name: :user_id, in: :path, description: "ID of user", required: true, type: :integer
    end
  end

  swagger_path "/users/{user_id}/sleeps?filter_start_time[begin_start_time]={begin_start_time}&filter_start_time[end_start_time]={end_start_time}" do
    operation :get do
      key :summary, "Get sleeps with filter start_time"
      key :description, "Returns all sleeps of user base on start_time range passed"
      key :operationId, "getSleepsFiltered"
      key :tags, [
        "user_sleeps_filter_start_time",
      ]
      parameter name: :user_id, in: :path, description: "ID of user", required: true, type: :integer
      parameter name: :begin_start_time, in: :path,
        description: "Start time of range(2021-01-01 00:00:00)", required: true, type: :string
      parameter name: :end_start_time, in: :path,
        description: "End time of range(2021-01-06 23:59:59)", required: true, type: :string
    end
  end

  swagger_path "/users/{user_id}/sleeps" do
    operation :post do
      key :summary, "Create new sleep"
      key :description, "Start time will default is time current if you do not pass any args(end time blank)"
      key :operationId, "createSleep"
      key :tags, [
        "user_create_sleep",
      ]
      parameter name: :user_id, in: :path, description: "ID of user", required: true, type: :integer
      parameter name: :start_time, in: :query, description: "Start time of sleep", type: :string
      parameter name: :end_time, in: :query, description: "End time of sleep", type: :string
    end
  end

  swagger_path "/users/{user_id}/sleeps/{id}" do
    operation :put do
      key :summary, "Update sleep"
      key :description, "End time will default is time current if you do not pass any args(start time will ont change)"
      key :operationId, "updateSleep"
      key :tags, [
        "user_update_sleep",
      ]
      parameter name: :user_id, in: :path, description: "ID of user", required: true, type: :integer
      parameter name: :id, in: :path, description: "ID of sleep", required: true, type: :integer
      parameter name: :start_time, in: :query, description: "Start time of sleep", type: :string
      parameter name: :end_time, in: :query, description: "End time of sleep", type: :string
    end
  end
end
