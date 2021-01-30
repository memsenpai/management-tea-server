# frozen_string_literal: true
class Docs::V1::RootController < ApplicationController
  include Swagger::Blocks

  swagger_root do
    key :swagger, "2.0"
    key :host, "localhost:3000"
    key :basePath, "/api/v1"
  end

  # A list of all classes that have swagger_* declarations.
  SWAGGERED_CLASSES = [
    ::Docs::V1::FollowsController,
    ::Docs::V1::SleepsController,
    self,
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
