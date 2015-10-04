class EventsController < ApplicationController

  before_action :find_event, only: [:show, :edit, :update, :destroy, :download]

  def index
    @events = Event.all
  end  

  def show
    @comment = Comment.new
    @comments = @event.comments.all
  end

  def new
    @event = Event.new
    @event.build_attachment
  end

  def edit
  end
      
  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event
    else
      render 'new'
    end    
  end


  def update
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
