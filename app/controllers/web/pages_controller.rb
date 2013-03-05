class Web::PagesController < Web::ApplicationController
  def show
    @page = Page.published.find params[:id]
    add_breadcrumb @page.title, page_path
    title @page
  end
end
