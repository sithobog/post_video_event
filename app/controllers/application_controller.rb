class ApplicationController < ActionController::Base
  
  before_action :set_locale

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def not_found_alert(obj = controller_name)
    "#{obj.singularize.capitalize} with id=#{params[:id]} doesn't exist"
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    { locale: I18n.locale }.merge options
  end

  private
    def grab_tags
      @tags = Tag.all
    end
  
end
