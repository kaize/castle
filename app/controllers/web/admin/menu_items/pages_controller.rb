class Web::Admin::MenuItems::PagesController < Web::Admin::MenuItems::ApplicationController
  def index
    @pages = resource_menu_item.pages.asc_by_order_at
  end

  def new
    @page = resource_menu_item.pages.new
  end

  def edit
    @page = resource_menu_item.pages.find(params[:id])
  end

  def create
    @page = resource_menu_item.pages.new params[:page]

    if @page.save
      flash_success
      redirect_to admin_menu_item_pages_path(resource_menu_item)
    else
      flash_error
      render action: :new
    end
  end

  def update
    @page = resource_menu_item.pages.find params[:id]

    if @page.update_attributes params[:page]
      flash_success
      redirect_to edit_admin_menu_item_page_path(resource_menu_item, @page.id)
    else
      flash_error
      render action: :edit
    end
  end

  def destroy
    @page = resource_menu_item.pages.find params[:id]
    @page.destroy
    redirect_to admin_menu_item_pages_path(resource_menu_item)
  end
end
