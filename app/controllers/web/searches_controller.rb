class Web::SearchesController < Web::ApplicationController
  def show
    add_breadcrumb :search
    @term = params[:term]
    @results = PgSearcher.search(@term).page(params[:page]).per(configus.per_page_count.searches)
  end
end
