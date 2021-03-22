class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @created_events= current_user.created_events

    render json: { 
      created_events: EventSerializer.new(@created_events).serializable_hash[:data].map{|event| event[:attributes]}
    }
  end

  # GET /events/1
  def show
    render json: @event
  end

  # POST /events
  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :start_time, :end_time, :location, :address, :notes, :invited_user_ids => [])
    end
end
