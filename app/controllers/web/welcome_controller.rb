class Web::WelcomeController < Web::ApplicationController
  def index
    @news = News.web.limit(3)
    @photo_album = PhotoAlbumDecorator.decorate PhotoAlbum.find_by_main(true)
  end
end
