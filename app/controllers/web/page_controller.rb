class Web::PageController < Web::ApplicationController
  def show
    @page = Page.find_by_uri params[:id]
    add_breadcrumb @page.title, page_path
    title @page
  end
end
