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
      #this will update all the attributes
      @event.update(params[:event])
    end
end