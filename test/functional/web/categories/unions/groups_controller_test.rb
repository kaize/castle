require 'test_helper'

class Web::Categories::Unions::GroupsControllerTest < ActionController::TestCase
  def setup
    @group = create :group
    @params = {category_id: @group.union.category.id, union_id: @group.union.id}
  end

  test "should get show" do
    @attrs = @params.merge( :id => @group.id)
    get :show, @attrs
    assert_response :success
  end
end
