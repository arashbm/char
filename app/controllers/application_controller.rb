require "application_responder"

class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :send_data_to_js
  before_action :simulate_slow_connection if Rails.env.development?

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

  def authorize
    authenticate_user!
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
  end
  
  def simulate_slow_connection
    sleep 2
  end

  def send_data_to_js
    gon.authenticityToken = form_authenticity_token
    gon.current_user = signed_in? ? current_user : nil
    gon.params = params
  end
end
