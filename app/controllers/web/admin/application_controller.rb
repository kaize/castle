class Web::Admin::ApplicationController < Web::ApplicationController
  helper_method :title_head

  before_filter do
    title_head
  end

  private

  def title_head
    scope = []
    scope << params[:controller].split('/')
    scope << params[:action] << [:title]
    t(:scope => scope)  
  end
end
