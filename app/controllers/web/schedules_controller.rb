class Web::SchedulesController < Web::ApplicationController
  add_breadcrumb :index, :news_index_path
  def index
    @unions = Union.all
  end

  def show
    @group = Group.find(params[:id])
    add_breadcrumb @group.name, schedule_path
  end
end
