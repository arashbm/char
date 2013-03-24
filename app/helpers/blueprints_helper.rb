module BlueprintsHelper
  def status_text(text) 
    t("activerecord.attributes.blueprint.statuses.#{text}")
  end

  def status_label_classes(s)
    case s
    when 'approved'
      'label label-success'
    when 'dipproved'
      'label label-important'
    else
      'label'
    end
  end

  def status_label(s)
    content_tag :span, status_text(s), class: status_label_classes(s) 
  end

  def collectify_statuses(list)
    Hash[list.map{ |s| [status_text(s), s] }]
  end
end
