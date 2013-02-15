class Web::PhotoAlbumsController < Web::ApplicationController
  def index
    @photo_albums = PhotoAlbumDecorator.decorate PhotoAlbum.published
    add_breadcrumb :photo_albums, photo_albums_path
  end
  
  def show
    @photo_album = PhotoAlbumDecorator.decorate PhotoAlbum.find(params[:id])
    add_breadcrumb @photo_album.name, photo_album_path
  end
  
end
