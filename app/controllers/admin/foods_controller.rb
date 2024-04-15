class Admin::FoodsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @foods = Food.all
    @user = current_user
    @genres = Genre.all
  end

  def show
    @food = Food.find(params[:id])
    @user = current_user
  end


end
