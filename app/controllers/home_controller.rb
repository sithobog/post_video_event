class HomeController < ApplicationController
  def index
    cloud
    @posts = Post.last(3).reverse
    @videos = Video.last(3).reverse
    @events = Event.last(3).reverse
  end

  private
    def cloud
      @tag_hash = Hash.new(0)
      @array_for_render = Array.new
      @tags = Tag.all

      # counting tags
      #
      ContentView.all.each do |article|
        article.tag_ids.each do |tag|
            @tag_hash[tag] +=1
        end
      end

      # create array for JQCloud
      _locale = "?locale=#{I18n.locale}"
      @tags.each do |tag|
        @array_for_render << {
          text: tag.name,
          weight: @tag_hash[tag.id],
          link: "tags/#{tag.slug}#{_locale}"
        }
      end
      # create variable for JS
      #
      gon.from_home_controller = @array_for_render

    end
end
