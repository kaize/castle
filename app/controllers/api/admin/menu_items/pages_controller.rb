class Api::Admin::MenuItems::PagesController < Api::Admin::MenuItems::ApplicationController
  def mass_update_order
    page_ids = params[:ids]
    pages = resource_menu_item.pages.find(page_ids)

    page_ids.map!(&:to_i)

    pages.each do | page|
      order = page_ids.index(page.id)
      page.update_attribute :order_at, order
    end

  head :ok
  end
end
