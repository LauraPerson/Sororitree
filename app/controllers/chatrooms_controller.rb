class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def create
    @chatroom = Chatroom.new
    @chatroom.guest_user = current_user
    @chatroom.user = User.find(params[:matching_user_id])
    authorize @chatroom
    @chatroom.save
    redirect_to chatroom_path(@chatroom)
  end

  def show
    @chatrooms = policy_scope(Chatroom.where(user: current_user).or(Chatroom.where(guest_user: current_user)))
    @message = Message.new
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
  end

  private

  def chatroom_params
   params.require(:chatroom).permit(:user_id)
  end
end
