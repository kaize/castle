class Api::Admin::StudyRequestsController < Api::Admin::ApplicationController
  respond_to :xlsx

  def index
    @q = StudyRequest.ransack(params[:q])
    @study_requests = @q.result
    respond_with @study_requests
    #respond_to do |format|
    #  format.csv { render text: ::Converters::StudyRequestConverter.to_csv(@study_requests)}
    #end
  end

end