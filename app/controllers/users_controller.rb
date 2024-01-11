class UsersController < ApplicationController
  def index
    @users = User.includes(:posts).all
  end

  def show
    @user = User.includes(:posts).find_by(id: params[:id])
    @recent_posts = @user.recent_posts
  end
end
