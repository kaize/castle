require 'test_helper'

class Web::SearchControllerTest < ActionController::TestCase

  setup do
    @page_activity = create :page_activity
    @union = create :union
  end

  test "should get index" do
    ThinkingSphinx::Test.run do
      get :index, term: @page_activity.name
      get :index, term: @union.name
      assert_response :success
    end
  end
end
