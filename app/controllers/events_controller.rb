class EventsController < ApplicationController
  # List all persons (show table of persons in HTML)
  def index
    @event = Event.all.entries
  end
  
  # Show detail for a person with ID = params[:id] (in HTML)
  def show
    @event = Event.find_by(id: params[:id])
  end
  
  # Form for adding a new person (in HTML)
  def new
    @event = Event.new
  end
  
  # POST to this to create a new person, then redirect to show
  def create
    @event = Event.create(event_params)
    @event.created_by = current_user
    @event.save
    
    redirect_to event_url
  end
  
  # Form for updating a person with ID = params[:id] (in HTML)
  def edit
    @event = Event.find_by(id: params[:id])
  end
  
  # PUT or PATCH to this to update person with ID = params[:id]
  # then redirect to show
  def update
    @event = Event.find_by(id: params[:id])
    
    @event.update_attributes(event_params)
    
    redirect_to event_url(@event)
  end
  
  # Destroy the person with ID = params[:id]
  # then redirect to index to list remaining persons
  def destroy
    @event = Event.find_by(id: params[:id])
    @event.destroy
    
    redirect_to event_url
  end
  
  private
  
  def event_params
    params.require(:event).permit(
      :event_name, :event_location, :event_date
    )
  end
end