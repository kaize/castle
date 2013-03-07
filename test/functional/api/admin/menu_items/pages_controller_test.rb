require 'test_helper'

class Api::Admin::MenuItems::PagesControllerTest < ActionController::TestCase
  setup do
    @menu_item = create :menu_item
    @page0 = create :page, order_at: 0, menu_item: @menu_item
    @page1 = create :page, order_at: 1, menu_item: @menu_item 
  end

  test "should update levels order" do
    put :mass_update_order, menu_item_id: @menu_item.id, ids: [@page1.id, @page0.id]
    assert_response :success
    @page0.reload
    @page1.reload

    assert_equal 1, @page0.order_at
    assert_equal 0, @page1.order_at
  end
  
  test "should update ids is not" do
    put :mass_update_order, menu_item_id: @menu_item.id 
    assert_response :success
  end
end
