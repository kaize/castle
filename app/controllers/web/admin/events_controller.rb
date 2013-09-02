class Web::Admin::EventsController < Web::Admin::ProtectedApplicationController

  def index
    @q = Event.ransack(params[:q])
    @events = @q.result.page(params[:page])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new params[:event]
    if @event.save
      flash_success
      redirect_to action: :index
    else
      flash_error

      render :new
    end
  end

  def edit
    @event = Event.find params[:id]
  end

  def update
    @event = Event.find params[:id]
    if @event.update_attributes params[:event]
      flash_success
      redirect_to action: :index
    else
      flash_error

      render :edit
    end
  end

  def destroy
    event = Event.find params[:id]
    event.destroy

    flash_success
    redirect_to action: :index
  end

end
