class Web::WelcomeController < Web::ApplicationController
  
  def index
    @news = News.web.limit(3)
    @photo_album = PhotoAlbum.find_by_main(true).decorate
    @event = Event.find_by_main true
    @events = Event.scoped
    @blocks = Block.web
  end
  
end
