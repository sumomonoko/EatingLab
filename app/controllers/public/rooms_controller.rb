class Public::RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:user_id])
    room = Room.create(leader_id: current_user.id, member_id: user.id)
    redirect_to user_room_path(room, user) 
  end

  def index
    my_room_id = current_user.dms.pluck(:room_id)
    @another_members = Dm
                       .where(room_id: my_room_id)
                       .where.not(user_id: current_user.id)
                       .preload(room: :messages).preload(user: { icon_attachment: :blob })
  end

  def show
    @room = Room.find(params[:id])
  end
end
