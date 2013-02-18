class Web::NewsController < Web::ApplicationController
  def index
    add_breadcrumb :home, :root_path
    add_breadcrumb :index, :news_index_path
    @news = News.page(params[:page]).by_created_at
  end

  def show
    @news = News.find(params[:id])
    add_breadcrumb :index, :news_index_path
    add_breadcrumb @news.title, :news_index_path
  end
end
