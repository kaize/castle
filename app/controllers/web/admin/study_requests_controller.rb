class Web::Admin::StudyRequestsController < Web::Admin::ApplicationController
  def index
    @q = StudyRequest.ransack(params[:q])
    @study_requests = @q.result.page(params[:page])
  end

  def show
    @study_requests = StudyRequest.find(params[:id])
  end

  def destroy
    @study_request = StudyRequest.find(params[:id])
    @study_request.destroy
    redirect_to admin_study_requests_path
  end
end
