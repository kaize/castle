class PhotoAlbumType < PhotoAlbum
  include BaseType

  attr_accessible :state_event, :photos_attributes, :mass_photo_loader
  attr_accessor :mass_photo_loader

  accepts_nested_attributes_for :photos, :reject_if => :all_blank, :allow_destroy => true

  def mass_photo_loader=(attrs)
    attrs.each do |image|
      photos.build :image => image
    end
  end

end