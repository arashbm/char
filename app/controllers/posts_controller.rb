class PostsController < ApplicationController
  before_action :authorize
  def index
    @posts = current_user.visible_posts.order('updated_at DESC')
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
    if @post.save
      current_user.activities.create(acted: @post, action: 'post:create')
    end
    respond_with(@post)
  end

  def update
    @post = current_user.editable_posts.find(params[:id])
    if @post.update(post_params)
      current_user.activities.create(acted: @post, action: 'post:update', parameters: { revision_id: @post.versions.last.id })
    end
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
    params.require(:post).permit(:title, :body, :on_blog)
  end
end
