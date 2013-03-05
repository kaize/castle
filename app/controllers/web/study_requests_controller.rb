class Web::StudyRequestsController < Web::ApplicationController

  add_breadcrumb :home, :root_path
  add_breadcrumb :study_request, :new_study_request_path
  
  def new
    title t (:study_request)
    @study_request = StudyRequest.new
  end

  def create
    @study_request = StudyRequest.new(params[:study_request])

    if @study_request.save
      flash_success
      redirect_to new_study_request_path
    else
      flash_error
      render action: "new"
    end
  end
end
