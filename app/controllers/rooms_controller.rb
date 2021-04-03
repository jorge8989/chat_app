class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @message = @room.messages.build
    @messages = @room.messages
  end
end