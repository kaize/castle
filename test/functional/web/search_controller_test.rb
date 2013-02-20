require 'test_helper'

class Web::SearchControllerTest < ActionController::TestCase

  setup do
    @union = create :union
  end

  test "should get index" do
    ThinkingSphinx::Test.run do
      get :index, term: @union.name
      assert_response :success
    end
  end
end
