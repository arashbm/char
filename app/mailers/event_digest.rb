class EventDigest < ActionMailer::Base
  default from: "no-reply@charpaye-online.com"

  ## HACKHACK!!
  module EventDigestHelper
    def current_user
      @user
    end
  end

  add_template_helper(EventDigestHelper)
  add_template_helper(ActivitiesHelper)

  def daily(user_id, activity_ids)
    @user = User.find(user_id)
    @activities = Activity.where(id: activity_ids)
    if @activities.count > 0
      mail to: @user.email
    end
  end
end
