class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    if @post.save
      redirect_to post_path(:id)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :published, :published_at)
  end
end
