class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update ]
  def index
    @posts = Post.all
  end
  def show
  end
  def new
    @post = Post.new
  end
  def create
    my_user = User.first
    @post = Post.new(post_params)
    @post.user_id = my_user.id
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
  end
  def update
  end

  private
  def post_params
    params.expect(post: [ :title, :content, :author ])
  end
  def set_post
    @post = Post.find(params[:id])
  end
end
