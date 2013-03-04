class Web::Admin::MenuItemsController < Web::Admin::ApplicationController
  def index
    @menu_items = MenuItem.all
  end
  
  def new
    @menu_item = MenuItem.new
  end
  
  def edit
    @menu_item = MenuItem.find params[:id]
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
