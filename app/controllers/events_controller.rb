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
end