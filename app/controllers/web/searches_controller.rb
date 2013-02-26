class Web::SearchesController < Web::ApplicationController
  def show
    q = params[:q]
    @results = q.present? ? PgSearch.multisearch(q) : PgSearch::Document.all
  end
end
