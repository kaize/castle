# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory 'photo_album/photo' do
    photo_album
    image { fixture_file_upload('/photos/test.png', :true) }
    name
    description
    main false
  end
end