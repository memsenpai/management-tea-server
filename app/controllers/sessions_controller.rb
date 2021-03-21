# frozen_string_literal: true
class SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user, only: :create

  def create
    user = User.find_by_email(sign_in_params[:email])

    if user && user.valid_password?(sign_in_params[:password])
      @current_user = user
      render json: user
    else
      render json: { errors: { "email or password" => ["is invalid"] } }, status: :unprocessable_entity
    end
  end

  private

  def sign_in_params
    params.require(:sign_in).permit(:email, :password)
  end
end
