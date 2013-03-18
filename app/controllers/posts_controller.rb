class PostsController < ApplicationController
  before_action :authorize
  def index
    @posts = current_user.visible_posts
    respond_with(@posts)
  end

  def show
    @post = current_user.visible_posts.find(params[:id])
    respond_with(@post)
  end

  def new
    @post = current_user.posts.new
    respond_with(@post)
  end

  def edit
    @post = current_user.editable_posts.find(params[:id])
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.save
    respond_with(@post)
  end

  def update
    @post = current_user.editable_posts.find(params[:id])
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    # this one is destructive
    @post = current_user.posts.find(params[:id])
    @post.destroy
    respond_with(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
