module ApplicationHelper
  def target_url
    target = controller.controller_name.singularize
    _symbol = "#{target}_id".to_sym
    _id = controller.instance_variable_get("@#{target}").id

    case target
    when 'post'
      post_comments_path(_symbol => _id, :target_type => target, :target_id => _id)
    when 'event'
      event_comments_path(_symbol => _id, :target_type => target, :target_id => _id)
    when 'video'
      video_comments_path(_symbol => _id, :target_type => target, :target_id => _id)
    end
  end
end
