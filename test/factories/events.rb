# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name
    content "MyText"
    begin_date "2013-01-23"
    end_date "2013-01-23"
    image { fixture_file_upload('/photos/test.png', :true) }
  end
end
