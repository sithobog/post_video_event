class TagsController < ApplicationController

  before_action :find_tag, only: [:show]

  def index
    @tags = Tag.all
  end  

  def new
    @tag = Tag.new
  end

  def show
    @entries = ContentView.any_tags(@tag.id).recently.page params[:page]
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
    @tag = Tag.where(slug: params[:id]).first
    @tag.destroy

    redirect_to tags_path
  end



  private
    def tag_params
      params.require(:tag).permit(:name, :slug)
    end

    def find_tag
      @tag = Tag.where(slug: params[:id]).first
      raise ActiveRecord::RecordNotFound.new("Tag by #{params[:id]} not found") if @tag.nil?
    end   

end
