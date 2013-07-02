module ActivitiesHelper
  def activity_verb(activity)
    if activity.actor == current_user
      t('activities.helpers.first_person_done')
    else
      t('activities.helpers.third_person_done')
    end
  end

  def activity_name(activity)
    if !activity.actor
      t('activities.helpers.someone')
    elsif activity.actor == current_user
      t('activities.helpers.you')
    else
      activity.actor.name
    end
  end
end
