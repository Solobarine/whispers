class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])

    @comment = Comment.new(
      author: current_user,
      post_id: params[:post_id],
      text: params[:text]
    )

    if @comment.save
      redirect_to user_post_path(current_user, @post)
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.permit(:author_id, :post_id, :text)
  end
end
