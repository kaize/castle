class Web::Admin::ApplicationController < Web::ApplicationController
  helper_method :title_head

  before_filter :title_head
  before_filter :authenticate_admin

private
  def title_head
    scope = []
    scope << params[:controller].split('/')
    scope << params[:action]
    t :title, scope: scope
  end
end
