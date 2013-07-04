module ActivitiesHelper
  def verb_suffix(actor)
    if actor == current_user
      t('activities.helpers.first_person_suffix')
    else
      t('activities.helpers.third_person_suffix')
    end
  end

  def activity_actor_name(actor)
    if !actor
      t('activities.helpers.someone')
    elsif actor == current_user
      t('activities.helpers.you')
    else
      actor.name
    end
  end
end
