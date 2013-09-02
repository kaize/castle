class Web::Admin::ApplicationController < Web::ApplicationController
  helper_method :title_head

  before_filter :title_head

private
  def title_head
    scope = []
    scope << params[:controller].split('/')
    action = params[:action]
    action = 'new' if action == 'create'
    action = 'edit' if action == 'update'
    scope << action
    t :title, scope: scope
  end
end
