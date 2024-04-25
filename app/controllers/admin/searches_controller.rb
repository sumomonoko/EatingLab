class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!
  def genre_search
    @genre_id = params[:genre_id]
    @foods = Food.where(genre_id: @genre_id).page(params[:page]).per(10).order(created_at: :desc)
    @genres = Genre.all
  end
  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @foods = Food.looks(params[:search], params[:word])
    end
    render "search_result"
  end

  def search_result
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @foods = Food.looks(params[:search], params[:word])
    end
  end
end
