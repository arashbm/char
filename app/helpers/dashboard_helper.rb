module DashboardHelper
  def gravatar(user: user, size: 55)
    image_tag user.gravatar_url(default: 'identicon', size: size), class: 'img-rounded media-object', alt: t("helpers.gravatar_alt", name: user.first_name)
  end
end
