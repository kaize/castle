class Web::Admin::MenuItemsController < Web::Admin::ApplicationController
  def index
    @menu_items = MenuItem.arrange
  end
  
  def new
    @menu_item = MenuItem.new
    menu_items = MenuItem.all
    @menu_items_roots = MenuItem.roots
    @menu_items = MenuItem.sort_by_ancestry(menu_items)
  end
  
  def edit
    @menu_item = MenuItem.find params[:id]
    menu_items = MenuItem.exclude(@menu_item)
    @menu_items_roots = menu_items.where ancestry: nil
    @menu_items = MenuItem.sort_by_ancestry(menu_items)
  end
  
  def create
    @menu_item = MenuItem.new params[:menu_item]
  
    if @menu_item.save
      flash_success
      redirect_to admin_menu_items_path
    else
      flash_error
      render action: :new
    end
  end
  
  def update
    @menu_item = MenuItem.find(params[:id])

    if @menu_item.update_attributes params[:menu_item]
      flash_success
      redirect_to edit_admin_menu_item_path(@menu_item)
    else
      flash_error
      render action: :edit
    end
  end
  
  def destroy
    @menu_item = MenuItem.find params[:id]
    @menu_item.destroy
    redirect_to admin_menu_items_path
  end
end
