# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :instructor do
    first_name { generate :name }
    last_name { generate :name }
    middle_name { generate :name }
    description
    avatar { fixture_file_upload('/photos/test.png', 'image/png', :true) }
  end
end
