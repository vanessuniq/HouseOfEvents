class Api::EventsController < ApplicationController
    before_action :find_event, only: [:update, :show, :destroy]
    skip_before_action :require_login, only: [:index, :show]
    # CRUD Actions

    def index
        # oreder events by date
        events = Event.order(date: :DESC)
        render json: {events: events}, status: 200
    end

    def show
        if @event
            render json: { event: EventSerializer.new(@event) }, status: 200
        else
            render json: { errors: ["The page you are looking for does not exist"] }, status: 404
        end
    end

    def create
        event = Event.create(event_params)
        if event.save
            render json: { logged_in: true, event: EventSerializer.new(event) }, status: :created
        else
            render json: { logged_in: true, errors: event.errors.full_messages }, status: 500
        end
    end

    def update
        if @event && @event.user_id == current_user.id
            if @event.update(event_params)
                render json: { logged_in: true, event: EventSerializer.new(@event) }, status: :200
            else
                render json: { logged_in: true, errors: @event.errors.full_messages }
            end
        else
            render json: { logged_in: true, errors: ["Unable to perform your request"] }
        end
    end
    
    def destroy
        if @event && @event.user_id == current_user.id
            @event.destroy
            render json: { logged_in: true, message: "Event successfully deleted" }, status: 204
        else
            render json: { logged_in: true, errors: ["Unable to perform your request"] }
        end
    end
    
    private

    def event_params
        params.require(:event).permit(:type, :date, :host, :title, :user_id)
    end

    def find_event
        @event = Event.find_by(id: params[:id])
    end
    
    
    
end