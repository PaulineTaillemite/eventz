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
      @event.update(event_params)
      redirect_to event_path(@event)
      #or redicect_to @event
    end

    def new
      #event initiates a new event object with Event.new
      @event = Event.new
    end

    def create
      @event = Event.new(event_params)
      @event.save
      redirect_to @event
    end

  private
    def event_params
      params.require(:event).
        permit(:name, :description, :location, :price, :starts_at)
    end
end