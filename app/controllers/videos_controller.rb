class VideosController < ApplicationController

  before_action :find_video, only: [:show, :edit, :update, :destroy]
  before_action :grab_tags, only: [:new, :edit]

  def index
    @videos = Video.all
  end  

  def show
    @tags = Tag.where(id: @video.tag_ids)
    @comment = Comment.new
    @comments = @video.comments.all
    respond_to do |format|
      format.html
      format.pdf do
        render template: "/videos/show.slim",
                pdf: "report",
                layout: "pdf.slim"
      end
    end
  end

  def new
    @video = Video.new
  end

  def edit
  end
      
  def create
    @video = Video.new(video_params)
    @video.tag_ids = params[:tag_ids]

    if @video.save
      redirect_to @video
    else
      render 'new'
    end    
  end


  def update
    @video.tag_ids = params[:tag_ids] if params[:tag_ids]
    if @video.update(video_params)
      redirect_to @video
    else
      render 'edit'
    end
  end 

  def destroy
    @video.destroy

    redirect_to videos_path
  end


  private
    def video_params
      params.require(:video).permit(:title, :slug, :description)
    end

    def find_video
      @video = Video.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      redirect_to videos_path, alert: not_found_alert
    end     
end
