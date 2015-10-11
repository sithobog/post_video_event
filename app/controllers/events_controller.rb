class EventsController < ApplicationController

  before_action :find_event, only: [:show, :edit, :update, :destroy, :download]
  before_action :grab_tags, only: [:new, :edit]

  def index
    @events = Event.all.page params[:page]
  end  

  def show
    @tags = Tag.where(id: @event.tag_ids)
    @comment = Comment.new
    @comments = @event.comments.all
    respond_to do |format|
      format.html
      format.pdf do
        render template: "/events/show.slim",
                pdf: "report",
                layout: "pdf.slim"
      end
    end
  end

  def new
    @event = Event.new
    @event.build_attachment
  end

  def edit
  end
      
  def create
    @event = Event.new(event_params)
    @event.tag_ids = params[:tag_ids]

    if @event.save
      redirect_to @event
    else
      render 'new'
    end    
  end


  def update
    @event.tag_ids = params[:tag_ids] if params[:tag_ids]
    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end 

  def destroy
    @event.destroy

    redirect_to events_path
  end

  def download
    path = "public#{@event.attachment.data_url}"
    send_file path, :x_sendfile=>true
  end

  private
    def event_params
      params.require(:event).permit(:title, :address, :started_at, attachment_attributes: [:data])
    end

    def find_event
      @event = Event.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      redirect_to events_path, alert: not_found_alert
    end   

end
