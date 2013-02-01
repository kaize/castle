class Web::Activities::ApplicationController < Web::ApplicationController
  helper_method :resource_activity
  
  protected

    def resource_activity
      @resurce_activity ||= Activity.find(params[:activity_id])
    end
end
