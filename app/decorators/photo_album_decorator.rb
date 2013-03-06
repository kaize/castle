class PhotoAlbumDecorator < ApplicationDecorator
  decorates :photo_album
  delegate_all
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       source.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def sorted_photos
    photos.by_main
  end

  def main_photo
    sorted_photos.first
  end

  def preview_photo(style = nil)
    main_photo.image_url(style) if main_photo
  end
end