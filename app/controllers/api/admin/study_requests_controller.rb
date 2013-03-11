class Api::Admin::StudyRequestsController < Api::Admin::ApplicationController
  respond_to :xlsx

  def index
    @q = StudyRequest.ransack(params[:q])
    @study_requests = @q.result
    respond_with @study_requests
  end

end