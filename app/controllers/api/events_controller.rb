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
    
    private

    def event_params
        params.require(:event).permit(:type, :date, :host, :title, :user_id)
    end
    
    
end