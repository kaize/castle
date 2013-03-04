class Web::EventsController < Web::ApplicationController

  def index
    
    @ran = [
        begin_date_lteq: params[:date],
        end_date_gteq: params[:date],
        m: "AND"
    ]
    @q = Event.ransack(@ran.first)
    @events = @q.result.asc_by_begin_date
    @date = params[:date]
    
    add_breadcrumb :home, :root_path
    add_breadcrumb :index, :events_path
  end
  
  def show
    @event = Event.find(params[:id])
    add_breadcrumb @event.name, :event_path
  end

end
