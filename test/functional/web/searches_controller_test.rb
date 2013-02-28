require 'test_helper'

class Web::SearchesControllerTest < ActionController::TestCase
  def setup
    create 'activity/page_activity'
    create :instructor
    create :news
    create :union
  end

  test "should get show" do
    get :show
    assert_response :success
  end
end
