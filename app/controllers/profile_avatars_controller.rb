class ProfileAvatarsController < ApplicationController
  def create
    ProfileAvatar.create(
      avatar_id: params[:avatar_id],
      user_id: current_user.id
    )
    redirect_to :back
  end
end
end
