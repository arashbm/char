require "application_responder"

class ApplicationController < ActionController::Base
  include Clearance::Controller
  self.responder = ApplicationResponder
  respond_to :html, :json

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def post_reviews_anchor(p)
    post_path p, anchor: "reviews"
  end

  def post_review_anchor(p,r)
    post_path p, anchor: "review_#{r.id}"
  end

  def post_discussions_anchor(p)
    post_path p, anchor: "discussions"
  end

  def post_discussion_anchor(p,c)
    post_path p, anchor: "discussion_#{c.id}"
  end

  helper_method :post_reviews_anchor, :post_review_anchor, :post_discussions_anchor, :post_discussion_anchor
end
