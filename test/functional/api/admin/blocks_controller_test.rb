require 'test_helper'

class Api::Admin::BlocksControllerTest < ActionController::TestCase
  setup do
    @block0 = create :block, order_at: 0
    @block1 = create :block, order_at: 1
  end

  test "should update levels order" do
    put :mass_update_order, ids: [@block1.id, @block0.id]
    assert_response :success

    @block0.reload
    @block1.reload

    assert_equal 1, @block0.order_at
    assert_equal 0, @block1.order_at
  end
end
