require 'test_helper'

class Api::Admin::PartnersControllerTest < ActionController::TestCase
  setup do
    user = create :user
    sign_in user

    @partner0 = create :partner, order_at: 0
    @partner1 = create :partner, order_at: 1
  end

  test "should update levels order" do
    put :mass_update_order, ids: [@partner1.id, @partner0.id]
    assert_response :success

    @partner0.reload
    @partner1.reload

    assert_equal 1, @partner0.order_at
    assert_equal 0, @partner1.order_at
  end
end
