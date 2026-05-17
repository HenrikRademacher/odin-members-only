class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :set_post, only: %i[ show edit update destroy ]
  def index
    @posts = Post.all
  end
  def show
  end
  def new
    @post = Post.new
  end
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    redirect_to @post if @post.user != current_user
  end
  def update
    if @post.user != current_user
      redirect_to @post
    elsif @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.expect(post: [ :title, :content, :author ])
  end
  def set_post
    @post = Post.find(params[:id])
  end
end
