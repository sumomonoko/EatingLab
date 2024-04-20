class Admin::SearchesController < ApplicationController
  def genre_search
    @genre_id = params[:genre_id]
    @foods = Food.where(genre_id: @genre_id)
  end
end
