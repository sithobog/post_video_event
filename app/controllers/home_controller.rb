class HomeController < ApplicationController
  def index
  	@posts = Post.last(3).reverse
  	@videos = Video.last(3).reverse
  	@events = Event.last(3).reverse
  end
end
