# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :partner do
    name
    image { fixture_file_upload('/photos/test.png', :true) }
    url
  end
end
