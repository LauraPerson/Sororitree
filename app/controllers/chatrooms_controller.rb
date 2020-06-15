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
    current_user == @chatroom.user ? @user_chat = @chatroom.guest_user : @user_chat = @chatroom.user
    NotificationsChannel.broadcast_to(@user_chat, @unread)
    authorize @chatroom
  end

  def destroy
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
    @chatroom.destroy
    if current_user.chatroom.empty?
      redirect_to user_path(current_user)
    else
      redirect_to chatroom_path(ordered_chatrooms.first)
    end
  end

  private

  def ordered_chatrooms
    #find the chatrooms for the current_user
    chatrooms_user = Chatroom.where(user: current_user).or(Chatroom.where(guest_user: current_user))
    #create an array with the ordered id_chatrooms within the last message
    messages_chat = Message.where(chatroom: chatrooms_user).order(created_at: :desc).pluck(:chatroom_id).uniq
    chatrooms_user.each do |chatroom|
      messages_chat << chatroom.id if messages_chat.exclude? chatroom.id
    end
    @chatrooms_ordered = Chatroom.find(messages_chat)
  end

  def chatroom_params
   params.require(:chatroom).permit(:user_id)
  end
end
