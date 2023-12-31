class CommentsController < ApplicationController
  before_action :find_post, only: [:create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.new(user: current_user, **comment_params)

    if @comment.save
      redirect_to user_post_path(@post.author, @post), notice: 'Comment Created Successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
