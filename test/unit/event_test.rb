require 'test_helper'

class EventTest < ActiveSupport::TestCase
  
  test "hide another from main" do
    e1 = create :event, main: true
    e2 = create :event, main: false  
    e2.update_attribute(:main, true)
    e1.reload
    assert_equal false, e1.main
  end 
end
