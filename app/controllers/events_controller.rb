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
    
    redirect_to event_url(@event)
  end
  
  # Form for updating a person with ID = params[:id] (in HTML)
  def edit
    @event = Event.find_by(id: params[:id])
  end
  
  # PUT or PATCH to this to update person with ID = params[:id]
  # then redirect to show
  def update
    @event = Event.find_by(id: params[:id])
    
    @event.update(event_params)
    
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
    year = params[:event].delete("event_time(1i)")
    month = params[:event].delete("event_time(2i)")
    day = params[:event].delete("event_time(3i)")
    hours = params[:event].delete("event_time(4i)")
    minutes = params[:event].delete("event_time(5i)")

    params[:event][:event_time] = Time.new(year, month, day, hours, minutes, 0)

    params.require(:event).permit(
      :event_name, :event_location, :event_date, :event_venue, :event_time, :bride_name, :event_type, :hotel, :flight_carrier, :flight_number, :date_start, :date_end
    )
  end
end
