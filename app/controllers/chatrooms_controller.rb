class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  before_action :ordered_chatrooms, only: :show

  def create
    @chatroom = Chatroom.new
    @chatroom.guest_user = current_user
    @chatroom.user = User.find(params[:matching_user_id])
    @chatroom.theme = Theme.find(params[:theme_id])
    authorize @chatroom
    @chatroom.save
    redirect_to chatroom_path(@chatroom)
  end

  def show
    @message = Message.new
    @chatroom = Chatroom.find(params[:id]) 
    @messages_read = Message.where.not(user: current_user).where(chatroom: @chatroom)
    @messages_read.each do |message| 
      message.read = true
      message.save
    end
    # @messages_read.update_all(read: true)
    authorize @chatroom
  end

  private

  def ordered_chatrooms
    chatrooms_user = Chatroom.where(user: current_user).or(Chatroom.where(guest_user: current_user))
    messages_chat = Message.where(chatroom: chatrooms_user).order(created_at: :desc).pluck(:chatroom_id).uniq
    @chatrooms_ordered = Chatroom.find(messages_chat)
  end

  def chatroom_params
   params.require(:chatroom).permit(:user_id)
  end
end
