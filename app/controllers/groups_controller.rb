# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    return nil if redirect_to_user(false)

    user = User.find(params[:user_id])
    return nil if redirect_to_user(user)

    @groups = Group.by_user(user.id).includes(:user).with_attached_image
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
      @group.image.attach(params[:group][:image]) if @group.image.attached?
      redirect_to groups_path(user_id: current_user.id)
    else
      flash.now[:error] = @group.errors.full_messages
      render :new
    end
  end

  def destroy
    @group = Group.find_by_id(params[:id])
    return if @group.nil?

    @group.destroy
    flash.notice = "Group #{@group.name} succesfully destroyed!"
    redirect_to groups_path(user_id: current_user.id)
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon, :image)
  end

  def redirect_to_user(user = nil)
    return unless user.nil? || params[:user_id].nil?

    redirect_to user_path(current_user)
    true
  end
end
