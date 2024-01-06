class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(user: current_user)

    if @like.save
      redirect_to user_post_path(@post.author, @post), notice: 'Like Created Successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end
end
