class Api::Admin::StudyRequestsController < Api::Admin::ApplicationController

  def index
    @q = StudyRequest.ransack(params[:q])
    @study_requests = @q.result
    respond_to do |format|
      format.xlsx
      format.csv { render text: ::Converters::StudyRequestConverter.to_csv(@study_requests)}
    end
  end

end