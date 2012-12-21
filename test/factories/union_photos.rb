# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory "union/photo" do
    name
    asset { fixture_file_upload('/photos/test.png', 'image/png', :true) }
    union
  end
end
