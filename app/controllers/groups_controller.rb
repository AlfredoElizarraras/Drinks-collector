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

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to current_user
    else
      flash[:error] = @group.errors.full_messages
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def show_groups?(user)
    redirect_to root_path if user.nil?
  end
end
