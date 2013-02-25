class Web::Admin::WelcomeController < Web::Admin::ApplicationController
  def index
  end
  before_filter :authenticate

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin@castle.ru" && password == "123456"
    end
  end
end
