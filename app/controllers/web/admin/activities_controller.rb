class Web::Admin::ActivitiesController < Web::Admin::ApplicationController

  def index
    @q = Activity.ransack(params[:q])
    @activities = @q.result.page(params[:page])
  end

  # GET /activities/1
  # GET /activities/1.json
=begin
  def show
    @activity = Activity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity }
    end
  end
=end

  def new
    @activity = ActivityType.new
  end

  def edit
    @activity = ActivityType.find(params[:id])
  end

  def create
    @activity = ActivityType.new params[:activity]

    if @activity.save
      flash_success
      redirect_to admin_activities_path
    else
      flash_error
      render action: :new
    end
    
  end

  def update
    @activity = ActivityType.find params[:id]

    if @activity.update_attributes params[:activity]
      flash_success
      redirect_to edit_admin_activity_path(@activity)
    else
      flash_error
      render action: :edit
    end
    
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to admin_activities_path
  end
end
