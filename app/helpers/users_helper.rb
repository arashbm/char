module UsersHelper
  def role_label(user)
    if user.role && user.role != ''
      content_tag :span, t("activerecord.attributes.user.roles.#{user.role}"), class: 'label label-info'
    else
      ''
    end
  end
end
