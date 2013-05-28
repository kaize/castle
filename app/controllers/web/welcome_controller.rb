class Web::WelcomeController < Web::ApplicationController
  
  def index
    @news = News.web.limit(configus.limits.news)
    #@photo_album = PhotoAlbum.find_by_main(true).decorate
    @event = Event.find_by_main true
    @events = Event.scoped
    @blocks = Block.web
  end
  
end
