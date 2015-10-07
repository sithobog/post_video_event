class TagsController < ApplicationController

  before_action :find_tag, only: [:destroy]

  def index
    @tags = Tag.all
  end  

  def new
    @tag = Tag.new
  end

      
  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to tags_path
    else
      render 'new'
    end    
  end


  def destroy
    @tag.destroy

    redirect_to tags_path
  end



  private
    def tag_params
      params.require(:tag).permit(:name, :slug)
    end

    def find_tag
      @tag = Tag.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      redirect_to tags_path, alert: not_found_alert 
    end   

end
