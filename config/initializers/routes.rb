# frozen_string_literal: true

if Rails.env.development? || Rails.env.test?
  Rails.application.routes.default_url_options[:host] = ENV["HOST"] || "localhost:3000"
end
