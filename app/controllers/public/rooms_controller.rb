class Public::RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:user_id])
    room = Room.create(leader_id: current_user.id, member_id: user.id)
    redirect_to user_room_path(current_user, room)
  end

  def show
    @room = Room.find(params[:id])
    @dms = @room.dms.includes(:user)
    @dm = Dm.new
  end

  def index
    @rooms = Room.where("member_id=#{params[:user_id]} or leader_id=#{params[:user_id]}")
  end
end
