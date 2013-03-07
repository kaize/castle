class Web::Admin::MenuItems::ApplicationController < Web::Admin::ApplicationController
  helper_method :resource_menu_item

protected
  def resource_menu_item
    @menu_item ||= MenuItem.find params[:menu_item_id]
  end
  
end
