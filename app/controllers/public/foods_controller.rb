class Public::FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:update, :destroy, :edit]
  def new
    @food = Food.new
  end

  def index
    @foods = Food.all
    @user = current_user
    @genres = Genre.all
  end

  def show
    @food = Food.find(params[:id])
    @user = @food.user
    @users = User.find(params[:id])
  end

  def edit
    @food = Food.find(params[:id])
  end

  def create
    @food =Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to food_path(@food.id)
    else
      render :new
    end
  end

  def update
    food = Food.find(params[:id])
    if food.update(food_params)
      flash[:notice] = "投稿の変更に成功しました。"
      redirect_to food_path(food.id)
    else
      render 'edit'
    end
  end

  private

  def food_params
    params.require(:food).permit(:genre_id, :title, :menu, :point, :image)
  end

  def is_matching_login_user
    food = Food.find(params[:id])
    unless food.user_id == current_user.id
      redirect_to foods_path
    end
  end
end
