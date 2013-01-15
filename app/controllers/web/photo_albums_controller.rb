class Web::PhotoAlbumsController < Web::ApplicationController
  def index
    @photo_albums = PhotoAlbumDecorator.decorate PhotoAlbum.published
    add_breadcrumb :photo_albums, photo_albums_path
  end
end
