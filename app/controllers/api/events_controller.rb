class Api::EventsController < ApplicationController
    before_action :find_event, only: [:update, :show, :destroy]
    # CRUD Actions

    def index
        # oreder events by date
        events = Event.order(date: :DESC)
        render json: {events: events}, status: 200
    end

    def show
        if @event
            render json: {event: EventSerializer.new(@event)}, status: 200
        else
            render json: {errors: ["The page you are looking for does not exist"]}, status: 404
        end
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

    def find_event
        @event = Event.find_by(id: params[:id])
    end
    
    
    
end