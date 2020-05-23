class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chatrooms = policy_scope(Chatroom)
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    authorize @chatroom
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
  end

  private

  def chatroom_params
   params.require(:chatroom)
  end
end
