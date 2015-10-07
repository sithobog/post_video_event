class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end  

  def show
    @comment = Comment.new
    @comments = @post.comments.all
  end

  def new
    grab_tags
    @post = Post.new
    @post.build_picture
  end

  def edit
    grab_tags
  end
      
  def create
    @post = Post.new(post_params)
    @post.tag_ids = params[:tag_ids]

    if @post.save
      redirect_to @post
    else
      render 'new'
    end    
  end


  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end 

  def destroy
    @post.destroy

    redirect_to posts_path
  end



  private
    def post_params
      params.require(:post).permit(:title, :slug, :content, picture_attributes: [:data])
    end

    def find_post
      @post = Post.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      redirect_to posts_path, alert: not_found_alert 
    end   

    def grab_tags
      @tags = Tag.all
    end
end
