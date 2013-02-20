class Web::SearchController < Web::ApplicationController
  def index
    @query = params[:term].present? ? params[:term] : nil 
    @results = []
    @results = Union.search @query
  end
end