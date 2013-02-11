class Web::EventsController < Web::ApplicationController

  def index
    @ran = [
        begin_date_lteq: params[:date],
        end_date_gteq: params[:date],
        m: "AND"
    ]
    @q = Event.ransack(@ran.first)
    @events = @q.result

    @date = params[:date]
  end

end
