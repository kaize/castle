class Web::StudyRequestsController < Web::ApplicationController

  def new
    @study_request = StudyRequest.new
  end

  def create
    @study_request = StudyRequest.new(params[:study_request])

    if @study_request.save
      redirect_to root_path
    else
      render action: "new"
    end
  end
end
