class Web::SearchController < Web::ApplicationController
  def index
    @query = params[:term].present? ? params[:term] : nil 
    @results = []
    if @query
      @results << PageActivity.search @query
      @results << Union.search @query
      @results
    end
  end
end