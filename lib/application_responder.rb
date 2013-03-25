class ApplicationResponder < ActionController::Responder
  include Responders::FlashResponder
  include Responders::HttpCacheResponder

  # Uncomment this responder if you want your resources to redirect to the collection
  # path (index action) instead of the resource path for POST/PUT/DELETE requests.
  # include Responders::CollectionResponder
end

class NestedResponder < ApplicationResponder
  protected

  def navigation_behavior(error)
    if get?
      raise error
    elsif has_errors? && default_action
      redirect_to resources[0...-1]
    else
      redirect_to navigation_location
    end
  end
end
