class Web::WelcomeController < Web::ApplicationController
  def index
    @news = News.web.limit(3)
  end
end
