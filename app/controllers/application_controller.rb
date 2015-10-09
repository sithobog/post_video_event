class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def not_found_alert(obj = controller_name)
  	"#{obj.singularize.capitalize} with id=#{params[:id]} doesn't exist"
  end

  private
	  def grab_tags
	  	@tags = Tag.all
	  end
  
end
