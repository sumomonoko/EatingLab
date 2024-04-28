class Public::RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:user_id])
    room = Room.create(leader_id: current_user.id, member_id: user.id)
    redirect_to user_room_path(user, room)
  end

  def show
    @room = Room.find(params[:id])
    @dms = @room.dms.includes(:user)
    @dm = Dm.new
  end

  def index
    @rooms = Room.all
  end
end
