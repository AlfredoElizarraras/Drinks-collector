# frozen_string_literal: true

class GroupsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    show_groups?(user)
    @groups = Group.by_user(user.id)
  end

  def show
    @group = Group.find(params[:id])
  end

  private

  def show_groups?(user)
    redirect_to root_path if user.nil?
  end
end
