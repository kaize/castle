class Web::Activities::PageActivitiesController < Web::Activities::ApplicationController
  def show
    @page_activity = resource_activity.page_activities.find(params[:id])
    
    add_breadcrumb resource_activity.name, activity_page_activities_path(resource_activity)
    add_breadcrumb @page_activity.name, activity_page_activity_path(resource_activity, @page_activity)

    title @page_activity
  end

  def index
    add_breadcrumb :home, :root_path
    add_breadcrumb resource_activity.name, activity_path(resource_activity)
    
    @page_activities = resource_activity.page_activities
    @activity = Activity.find(params[:activity_id])
    title @activity
  end
end
