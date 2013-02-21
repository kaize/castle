class Web::NewsController < Web::ApplicationController
  add_breadcrumb :index, :news_index_path
  def index
    add_breadcrumb :home, :root_path
    @news = News.page(params[:page]).by_created_at
  end

  def show
    @news = News.find(params[:id])
    add_breadcrumb @news.title, :news_index_path
    title @news
  end
end
