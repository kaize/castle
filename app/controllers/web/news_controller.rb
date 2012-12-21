class Web::NewsController < Web::ApplicationController
  def index
    @news = News.page(params[:page]).by_created_at
  end

  def show
    @news = News.find(params[:id])
  end
end
