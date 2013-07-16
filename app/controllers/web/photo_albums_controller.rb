class Web::PhotoAlbumsController < Web::ApplicationController
  def index
    add_breadcrumb :home, :root_path
    title t (:photo_albums)
    @photo_albums = PhotoAlbum.published.page(params[:page]).per(configus.per_page_count.photo_albums).decorate

    add_breadcrumb :photo_albums, photo_albums_path
  end
  
  def show
    @photo_album = PhotoAlbum.find(params[:id]).decorate
    add_breadcrumb :photo_albums, photo_albums_path
    add_breadcrumb @photo_album.name, photo_album_path
    title t (:photo_albums)
    title @photo_album.name
  end
  
end
