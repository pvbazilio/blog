class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :is_admin!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    return redirect_to post_path(@post), notice: 'A publicação foi criada com sucesso!' if @post.save
    render :new
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'A publicação foi atualizada com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :published, :published_at, :body, :thumbnail, :banner)
  end
end
