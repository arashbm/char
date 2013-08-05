module RevisionsHelper
  def show_diff(a,b)
    diff = Diffy::Diff.new(h(a),h(b), diff: ['--minimal', '-w', '-U10000'], include_plus_and_minus_in_html: true )
    diff.to_s(:html).html_safe
  end

  def previous_next_btn(rev)
    previous_link =  if rev.try(:previous)
      link_to(t('.previous_html'), post_revision_path(rev.item_id, rev.previous), class: 'btn')
    else
      link_to(t('.previous_html'), '#', class: 'btn disabled')
    end
    next_link = if rev.try(:next)
      link_to(t('.next_html'), post_revision_path(rev.item_id, rev.next), class: 'btn')
    else
      link_to(t('.next_html'), '#', class: 'btn disabled')
    end

    "#{previous_link} #{next_link}".html_safe
  end

  def terminator_name(rev)
    rev.terminator ? User.find(rev.terminator.to_i).name : t('.unknown_terminator')
  end

  def calc_diff(rev, attribute)
    diffed = if rev.event == 'create' || rev.changeset.include?(attribute.to_s)
               show_diff(*(rev.changeset[attribute.to_s]))
             else
               simple_format(rev.reify[attribute.to_sym])
             end
    diffed.html_safe
  end

  def event_name(rev)
    t("activerecord.attributes.version.events.#{rev.event}")
  end
end
