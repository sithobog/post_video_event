class HomeController < ApplicationController
  def index
  	cloud
  	@posts = Post.last(3).reverse
  	@videos = Video.last(3).reverse
  	@events = Event.last(3).reverse
  end

  private
	  def cloud
	  	@array_for_render = Array.new
	  	@tags = Tag.all
	  	@tags.each do |tag|
	  		tag_count = ContentView.any_tags(tag.id).count
	  		@array_for_render <<{
	  			text: tag.name,
	  			weight: tag_count,
	  			link: "tags/#{tag.slug}"
	  		}
	  	end
	  	gon.from_home_controller = @array_for_render
	  end
end
