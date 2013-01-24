class Web::WelcomeController < Web::ApplicationController
  def index
    @news = News.web.limit(3)
    photo_album = PhotoAlbum.find_by_main(true)
    @photo_album = photo_album.try :decorate
    @events = Event.scoped
  end
end
