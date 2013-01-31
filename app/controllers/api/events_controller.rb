class Api::EventsController < Api::ApplicationController

  def index
    @q = Event.ransack(params[:q])
    @events = @q.result
    prepare_events @events
  end

  def prepare_events (events)
    @events["count"] = events.length
    events.each_with_index do |event, index|
      @events["items"][index] = event []
    end
  end


end