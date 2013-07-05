module ActivitiesHelper

  def activity_params(activity)
    params = { actor_name: activity_actor_name(activity.actor), verb_suffix: verb_suffix(activity.actor) }
    add_params = case activity.action
                 when 'post:create'
                   {
                     post_title: activity.acted.title,
                     post_path: post_path(activity.acted),
                   }
                 when 'post:update'
                   {
                     post_title: activity.acted.title,
                     post_path: post_path(activity.acted),
                     revision_path: post_revision_path(activity.acted, activity.parameters[:revision_id])
                   }
                 when 'review:create'
                   {
                     post_title: activity.acted.post.title,
                     post_path: post_path(activity.acted.post),
                     review_path: post_review_anchor(activity.acted.post, activity.acted)
                   }
                 when 'review:update'
                   {
                     post_title: activity.acted.post.title,
                     post_path: post_path(activity.acted.post),
                     review_path: post_review_anchor(activity.acted.post, activity.acted)
                   }
                 when 'blueprint:create'
                   {
                     blueprint_title: activity.acted.title,
                     blueprint_path: blueprint_path(activity.acted)
                   }
                 when 'blueprint:update'
                   {
                     blueprint_title: activity.acted.title,
                     blueprint_path: blueprint_path(activity.acted)
                   }
                 when 'discussion:create'
                   {
                     # discussable_type: activity.acted.discussable_type.constantize.model_name.human,
                     # discussable_title: activity.acted.discussable.title,
                     # discussable_path: url_for(activity.acted.discussable)
                     discussable_type: Blueprint.model_name.human,
                     discussable_title: activity.acted.blueprint.title,
                     discussable_path: url_for(activity.acted.blueprint)
                   }
                 else
                   {}
                 end
    params.merge! add_params
    # making sure no one is doing anything nasty
    Hash[params.map {|k,v| [k,h(v)] }]
  end


  def activity_translation(activity)
    t "activities.#{activity.action.gsub ':', '.'}_html", activity_params(activity)
  end

  def verb_suffix(actor)
    if actor == current_user
      t('activities.helpers.first_person_suffix')
    else
      t('activities.helpers.third_person_suffix')
    end
  end

  def activity_actor_name(actor, link = false)
    if !actor
      t('activities.helpers.someone')
    elsif actor == current_user
      t('activities.helpers.you')
    else
      link ? link_to(actor.name, actor) : actor.name
    end
  end
end
