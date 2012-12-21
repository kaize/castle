# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory "news/photo" do
    news
    asset { fixture_file_upload('/photos/test.png', 'image/png', :true) }
  end
end
