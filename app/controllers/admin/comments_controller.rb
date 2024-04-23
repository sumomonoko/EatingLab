class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  def destroy
    food_comment = Comment.find(params[:id])
    @food = food_comment.food
    food_comment.destroy
  end
end
