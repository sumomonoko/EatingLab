class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:edit, :update, :withdrow]
  before_action :authorize_user, only: [:update]

  def show
    @user = User.find(params[:id])
    @foods = @user.foods.page(params[:page]).per(15).order(created_at: :desc)
    # DM機能
    @current_member = Dm.where(user_id: current_user.id)
    @another_member = Dm.where(user_id: @user.id)
    unless @user.id == current_user.id
      @current_member.each do |current|
        @another_member.each do |another|
          if current.room_id == another.room_id
            @is_room = true
            @room_id = current.room_id
          end
        end
      end
      unless @is_room
        @room = Room.new
        @dm = Dm.new
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def check
    @user = User.find(params[:id])
  end

  #退会機能
  def withdraw
    @user = User.find(current_user.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_active: false)
    #セッション情報を全て削除
    reset_session
    flash[:notice] = "退会処理を実行いたしました。"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image, :is_active, :email)
  end

  def is_matching_login_user
    user = User.find(current_user.id)
    unless user.id == current_user.id
      redirect_to new_user_session_path
    end
  end

  def authorize_user
    redirect_to foods_path, alert: '他のユーザーの情報を編集することはできません。' unless current_user == @user
  end

end
