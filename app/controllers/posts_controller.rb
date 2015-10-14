class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :grab_tags, only: [:new, :edit]

  def index
    @posts = Post.all.page params[:page]
  end  

  def show
    @hash_for_js = @post.settings
    gon.css_style = @post.settings
    @tags = Tag.where(id: @post.tag_ids)
    @comment = Comment.new
    @comments = @post.comments.all
    respond_to do |format|
      format.html
      format.pdf do
        render template: "/posts/show.pdf.slim",
                pdf: "report",
                layout: "pdf.slim"
      end
    end
  end

  def new
    @post = Post.new
    @post.build_picture
  end

  def edit
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
    @post.tag_ids = params[:tag_ids] if params[:tag_ids]
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
      params.require(:post).permit(:title, :slug, :content, :color, :bgcolor, :font_size, picture_attributes: [:data])
    end

    def find_post
      @post = Post.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      redirect_to posts_path, alert: not_found_alert 
    end   
end
