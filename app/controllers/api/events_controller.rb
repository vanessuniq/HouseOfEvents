class Api::EventsController < ApplicationController
    # CRUD Actions

    def index
        # oreder events by date
        events = Event.order(date: :DESC)
        render json: {events: events}, status: 200
    end

    def show
        
    end

    def create
        
    end

    def update
        
    end
    
    def destroy
        
    end
    
    
    
end