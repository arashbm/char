module UsersHelper
  def last_activity(user)
    if l = current_user.activities.order('created_ar DESC').last
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
