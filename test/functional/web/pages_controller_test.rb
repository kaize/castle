require 'test_helper'

class Web::PagesControllerTest < ActionController::TestCase
  def setup
    @page = create :page
    @params = {id: @page}
  end

  test "should get show" do
    get :show, @params
    assert_response :success
  end

end
