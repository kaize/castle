class Web::Activities::PageActivitiesController < Web::ApplicationController
  def show
    @activity = Activity.find(params[:activity_id])
    @page_activity = @activity.page_activities.find(params[:id])
    add_breadcrumb @activity.name, activity_path(@activity)
    add_breadcrumb @page_activity.name, activity_page_activity_path(@activity, @page_activity)
  end

  def index
    @activity = Activity.find(params[:activity_id])
    @page_activities = @activity.page_activities
  end
end
