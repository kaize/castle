class Web::PagesController < Web::ApplicationController
  def show
    @page = Page.published.find_by_uri params[:id]
    if @page.present?
      add_breadcrumb @page.title, page_path
      title @page
    end
  end
end
