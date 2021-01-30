# frozen_string_literal: true
if Rails.env.development? || Rails.env.staging?
  SwaggerUiEngine.configure do |config|
    config.swagger_url = {
      v1: "/api/v1"
    }

    config.json_editor = true
    config.request_headers = true
  end
end
