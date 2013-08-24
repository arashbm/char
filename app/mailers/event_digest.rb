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
    day = I18n.l(@activities.last.created_at.to_date, format: :superlong)
    if @activities.count > 0
      mail to: @user.email, subject: I18n.t("event_digest.daily.subject", { day: day })
    end
  end
end
