class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:edit, :update, :withdrow]
  before_action :authorize_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @foods = @user.foods
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
