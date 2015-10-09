module ApplicationHelper

  def target_url
    target = controller.controller_name.singularize
    _symbol = "#{target}_id".to_sym
    _id = controller.instance_variable_get("@#{target}").id

    send("#{target}_comments_path",_symbol => _id, :target_type => target, :target_id => _id)
  end

  def link_to_pdf(obj)
  	"<a href='#{obj.id}.pdf' class='btn btn-info pull-right'>View pdf</a>"
  end
end
