# frozen_string_literal: true
SwaggerUiEngine.configure do |config|
  config.swagger_url = {
    v1: "/api/v1"
  }

  config.json_editor = true
  config.request_headers = true
end
