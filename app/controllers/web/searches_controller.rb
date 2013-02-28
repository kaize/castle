class Web::SearchesController < Web::ApplicationController
  def show
    @term = params[:term]
    @results = PgSearcher.search(@term).page(params[:page]).per(20)
  end
end
