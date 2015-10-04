class CommentsController < ApplicationController

  def create
    find_target
    @comment = @target.comments.create(comment_params)
    respond_to do |format|
      format.html {redirect_to :controller => @target.class.to_s.pluralize.downcase, :action => :show, :id => @target.id}
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end

  private

  def find_target
    @klass = params[:target_type].capitalize.constantize
    @target = @klass.find(params[:target_id])
  end

  def comment_params
    params.require(:comment).permit(:author_name, :content)
  end  

end
