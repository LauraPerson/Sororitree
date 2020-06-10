class ProfileAvatarsController < ApplicationController
  def new
    profile_avatar = ProfileAvatar.new()
    authorize profile_avatar
  end

  def create
    profile_avatar = ProfileAvatar.new(
      avatar_id: params[:avatar_id],
      user_id: current_user.id
    )
    authorize profile_avatar
    profile_avatar.save
    redirect_to user_path(current_user)
  end

  def update
    profile_avatar = ProfileAvatar.find_by(user: current_user)
    profile_avatar.avatar_id = params[:avatar_id]
    authorize profile_avatar
    profile_avatar.save
  end
end
