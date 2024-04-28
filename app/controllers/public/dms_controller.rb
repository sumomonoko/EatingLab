class Public::DmsController < ApplicationController
  before_action :authenticate_user!

  def create
    room = Room.find(params[:room_id])
    current_user.dms.create(dm_params)
    redirect_to user_room_path(room.dm_partner(current_user), room)
  end

  private

  def dm_params
    params.permit(:message, :room_id, :user_id)
    
  end
end
