class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @post = @user.posts.includes(:comments).find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.build(post_params)
    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post Created Successfully'
    else
      render :new
    end
  end

  def destroy
    @user = current_user
    @post = @user.posts.find(params[:id])
    @post.destroy
    @post.update_posts_counter
    redirect_to user_posts_path(@user), notice: 'Post was successfully Deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
