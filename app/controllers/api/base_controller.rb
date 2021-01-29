# frozen_string_literal: true
class Api::BaseController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_404

  private
  def rescue_404
    return head :not_found
  end
end
