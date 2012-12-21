require 'test_helper'

class Web::NewsControllerTest < ActionController::TestCase
  def setup
    @news = create :news
    @params = {id: @news.id}
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, @params
    assert_response :success
  end

end
