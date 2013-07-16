require 'test_helper'

class Web::SearchesControllerTest < ActionController::TestCase
  def setup
    create :page
    create :instructor
    create :news
    create :union
    create :event
  end

  test "should get show" do
    get :show
    assert_response :success
  end
end
