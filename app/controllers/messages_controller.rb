class MessagesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.build(message_params.merge({user_id: current_user.id}))
    if @message.save
      ActionCable.server.broadcast "chat_channel_#{@room.id}", content: { message: @message.content, user: @message.user.email }
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:content)
  end
end