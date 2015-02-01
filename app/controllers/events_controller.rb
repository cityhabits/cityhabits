class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @upcoming_events = Event.all.where(['event_date > ?', Date.today.to_datetime]).order( 'event_date ASC' )
    @recent_events = Event.all.where(['event_date < ?', Date.today.to_datetime]).order( 'event_date DESC' )
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    flash[:notice] = 'Event was successfully created.' if @event.save
    redirect_to @event
  end

  def update
    @event = Event.find(params[:id])

    flash[:notice] = 'Event was successfully updated.' if @event.update(event_params)
    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :venue, :city, :description, :event_date, :event_page_url, :avatar)
    end
end
