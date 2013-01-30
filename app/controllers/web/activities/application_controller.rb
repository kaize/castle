class Web::Activities::ApplicationController < Web::ApplicationController
  protected

    def resource_activity
      Activity.find(params[:activity_id])
    end
end
