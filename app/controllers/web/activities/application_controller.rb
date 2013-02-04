class Web::Activities::ApplicationController < Web::ApplicationController
  helper_method :resource_activity
  
  add_breadcrumb :home, :root_path
  
  protected

    def resource_activity
      @resurce_activity ||= Activity.find(params[:activity_id])
    end
end
