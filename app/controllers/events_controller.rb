class EventsController < ApplicationController
    def index
       @events = Event.upcoming
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
      if @event.update(event_params)
      flash[:notice] = "Event successfully updated"
      redirect_to event_path(@event)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def new
      #event initiates a new event object with Event.new
      @event = Event.new
    end

    def create
      @event = Event.new(event_params)
      if @event.save
      redirect_to @event, notice: "Event sucessflully created"
      else 
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @event = Event.find(params[:id])
      @event.destroy
      redirect_to events_url, status: :see_other
    end

  private
    def event_params
      params.require(:event).
        permit(:name, :description, :location, :price, :starts_at, :image_file_name, :capacity)
    end
end