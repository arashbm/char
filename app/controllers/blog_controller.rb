class BlogController < ApplicationController

  before_action :get_posts

  def index
    respond_with @posts
  end

  def show
    @post = @posts.find(params[:id])
    respond_with @post
  end

  private

  def get_posts
    @posts = Post.where(on_blog: true)
  end

end
