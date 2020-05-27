class MessagesController < ApplicationController
  before_action :authenticate_user!
  belongs_to :chatroom

  def create
    @chatroom = Chatroom.find(:chatroom_id)
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    authorize @message
    raise
    if @message.save
      redirect_to chatroom_path(@chatroom)
    else
      render '/chatrooms/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id, :user_id)
  end
end
