class EventsController < ApplicationController
    def index
       @events = Event.all
    end
    #using id as parameter for find method
    def show
       @event = Event.find(params[:id])
    end

    def edit
      @event = Event.find(params[:id])
    end

    #we find the event and then use the update method (same as in the console) fetching the hash
    def update
      @event = Event.find(params[:id])
      event_params = params.require(:event).permit(:name, :description, :location, :price, :starts_at)
      @event.update(event_params)
      redirect_to event_path(@event)
      #or redicect_to @event
    end
end