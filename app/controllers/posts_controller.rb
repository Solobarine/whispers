class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.new(
      author: current_user,
      title: params[:title],
      text: params[:text],
      comments_counter: 0,
      likes_counter: 0
    )
    
    if @post.save
      redirect_to user_posts_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end
end
