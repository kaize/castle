class Web::SearchesController < Web::ApplicationController
  def show
    @results = PgSearcher.search params[:q]
  end
end
