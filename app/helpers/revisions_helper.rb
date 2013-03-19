module RevisionsHelper
  def show_diff(a,b)
    diff = Differ.diff_by_word h(b), h(a)
    diff.format_as(:html).html_safe
  end

  def previous_next_btn(rev)
    previous_link =  if rev.try(:previous)
      link_to(t('.previous_html'), post_revision_path(rev.reify, rev.previous), class: 'btn')
    else
      link_to(t('.previous_html'), '#', class: 'btn disabled')
    end
    next_link = if rev.try(:next)
      link_to(t('.next_html'), post_revision_path(rev.reify, rev.next), class: 'btn')
    else
      link_to(t('.next_html'), '#', class: 'btn disabled')
    end
    "<div class='btn-group'>#{previous_link}#{next_link}</div>".html_safe
  end

  def originator_name(rev)
    rev.originator ? User.find(rev.originator).name : t('.unknown_originator')
  end

  def diff(rev, attribute)
    diff = if rev.changeset.include? attribute.to_s
      simple_format(show_diff(*(rev.changeset[attribute.to_s])))
    else
      simple_format(rev.reify[attribute.to_sym])
    end
    diff.html_safe
  end

  def event_name(rev)
    t("activerecord.attributes.version.events.#{rev.event}")
  end
end
