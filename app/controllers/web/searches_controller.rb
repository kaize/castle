class Web::SearchesController < Web::ApplicationController
  def show
    @results = PgSearcher.search params[:term]
  end
end
