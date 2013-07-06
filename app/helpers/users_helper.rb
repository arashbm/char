module UsersHelper
  def latest_activity(user)
    if l = user.activities.order('created_at DESC').first
      time_ago_in_words(l.created_at)
    else
      t('helpers.never')
    end
  end

  def role_label(user)
    if user.role && user.role != ''
      content_tag :span, t("activerecord.attributes.user.roles.#{user.role}"), class: 'label label-info'
    else
      ''
    end
  end
end
