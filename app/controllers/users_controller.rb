# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(user_params[:id])
  end

  private

  def user_params
    params.permit(:id)
  end
end
