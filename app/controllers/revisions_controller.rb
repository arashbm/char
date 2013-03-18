class RevisionsController < ApplicationController

  before_action :find_post

  def index
    respond_with @revisions
  end

  def show
    @revision = @revisions.find params[:id]
    respond_with @revision
  end

  private

  def find_post
    @post = current_user.visible_posts.find(params[:post_id])
    @revisions = @post.versions    
  end
end
