class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chatrooms = policy_scope(Chatroom)
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.user = current_user
    authorize @chatroom
  end

  def show
    @message = Message.new
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
  end

  private

  def chatroom_params
   params.require(:chatroom).permit(:user_id)
  end
end
