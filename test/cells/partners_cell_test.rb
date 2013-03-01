require 'test_helper'

class PartnersCellTest < Cell::TestCase
  test "index" do
    invoke :index
    assert_select "p"
  end
  

end
