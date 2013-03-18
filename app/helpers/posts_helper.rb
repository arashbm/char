# encoding: UTF-8
module PostsHelper
  def post_footer(post)
    lnks =[]
    lnks << link_to(t("helpers.links.edit_html"), edit_post_path(post)) if current_user.editable_posts.include? post
    lnks << link_to(t("helpers.links.revisions_html", count: 0 ), '{post_revisions_path(post)}')
    lnks << link_to(t("helpers.links.reviews_html", count: 0 ), '{post_show_reviews_path(post)}')
    content_tag :div, lnks.join(' | ').html_safe
  end

  def truncated_body(post)
    truncate post.body, length: 700, separator: ".", ommision: "… #{ link_to t('helpers.read_on'), post_path(post)}"
  end

  def truncated_title(post)
    truncate post.title, length: 25, separator: ' '
  end
end
