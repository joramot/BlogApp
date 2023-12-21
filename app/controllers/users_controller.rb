class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: param[:id])
    @recent_posts = @user.recent_posts
  end
end
