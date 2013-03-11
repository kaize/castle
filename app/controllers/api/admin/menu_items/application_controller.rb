class Api::Admin::MenuItems::ApplicationController < Api::Admin::ApplicationController
  protected
    def resource_menu_item
      @menu_item ||= MenuItem.find params[:menu_item_id]
    end
end
