class VideosController < ApplicationController

  before_action :find_video, only: [:show, :edit, :update, :destroy]

  def index
    @videos = Video.all
  end  

  def show
    @comment = Comment.new
    @comments = @video.comments.all
  end

  def new
    @video = Video.new
  end

  def edit
  end
      
  def create
    @video = Video.new(video_params)

    if @video.save
      redirect_to @video
    else
      render 'new'
    end    
  end


  def update
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
