# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory "group/schedule" do
    week "MyString"
    start_at { generate :datetime }
    finish_at { generate :datetime }
    group
    
  end
end
