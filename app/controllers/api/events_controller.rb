class Api::EventsController < Api::ApplicationController

  def index
    @q = Event.ransack(params[:ran])
    @events = @q.result
  end

end