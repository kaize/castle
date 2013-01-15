class Web::Admin::NewsController < Web::Admin::ApplicationController

  def index
    @q = News.ransack params[:q]
    @news = @q.result.page(params[:page])
  end

  def new
    @news = NewsType.new
  end

  def edit
    @news = NewsType.find(params[:id])
  end

  def create
    @news = NewsType.new params[:news]

    if @news.save
      flash_success
      redirect_to admin_news_index_path
    else
      flash_error
      render action: :new
    end
  end

  def update
    @news = NewsType.find params[:id]

    if @news.update_attributes params[:news]
      flash_success
      redirect_to edit_admin_news_path(@news)
    else
      flash_error
      render action: :edit
    end
  end

  def destroy
    @news = News.find params[:id]
    @news.destroy
    redirect_to admin_news_index_path
  end
end
