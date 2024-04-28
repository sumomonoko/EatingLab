class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:edit, :update, :withdrow]
  before_action :authorize_user, only: [:update, :edit ]
  before_action :guest_user, only: [:edit, :show]

  def show
    @user = User.find(params[:id])
    @foods = @user.foods.page(params[:page]).per(15).order(created_at: :desc)
    # DM機能
    room = current_user.room_with(@user)
    if room
      @is_room = true
      @room_id = room.id
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.image.attach(params[:user][:image]) if @user.image.blank?
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
    user = User.find(params[:id])
    unless current_user == user
      redirect_to foods_path, alert: '他のユーザーの情報を編集することはできません。'
    end
  end

  def guest_user
    if current_user.email == 'guest@example.com'
      redirect_to foods_path
    end
  end

end
