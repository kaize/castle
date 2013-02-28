class Web::Admin::StudyRequestsController < Web::Admin::ApplicationController
  def index
    @q = StudyRequest.ransack(params[:q])
    @study_requests = @q.result.page(params[:page])
    respond_to do |format|
      format.html
      format.csv { render text: @study_requests.to_csv}
    end
  end

  def show
    @study_requests = StudyRequest.find(params[:id])
  end
  
  def create
    @study_request = StudyRequest.new params[:study_request]

    if @study_request.save
      flash_success
      redirect_to admin_study_requests_path
    else
      flash_error
      render action: :new
    end
  end
  
  def destroy
    @study_request = StudyRequest.find(params[:id])
    @study_request.destroy
    redirect_to admin_study_requests_path
  end
end
