class Web::Admin::PagesController < Web::Admin::ApplicationController
  def index
    @q = Page.search(params[:q])
    @pages = @q.page(params[:page])
  end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.new params[:page]

    if @page.save
      flash_success
      redirect_to admin_pages_path
    else
      flash_error
      render action: :new
    end
  end

  def update
    @page = Page.find params[:id]

    if @page.update_attributes params[:page]
      flash_success
      redirect_to edit_admin_page_path(@page.id)
    else
      flash_error
      render action: :edit
    end
  end

  def destroy
    @page = Page.find params[:id]
    @page.destroy
    redirect_to admin_pages_path
  end
end
