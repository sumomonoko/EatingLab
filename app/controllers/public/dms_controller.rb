class Public::DmsController < ApplicationController
  before_action :authenticate_user!

  def create
    room = Room.find(params[:id])
    message = current_user.messages.new(dm_params)
    message.save
    redirect_to user_room_path(room)
  end

  private

  def dm_params
    params.require(:dm).permit(:message, :room_id, :user_id)
  end
end
