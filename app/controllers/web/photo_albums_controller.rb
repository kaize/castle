class Web::PhotoAlbumsController < Web::ApplicationController
  def index
    title t (:photo_albums)
    @photo_albums = PhotoAlbumDecorator.decorate PhotoAlbum.published
    add_breadcrumb :photo_albums, photo_albums_path
  end
end
