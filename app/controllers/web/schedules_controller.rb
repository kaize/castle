class Web::SchedulesController < Web::ApplicationController
  def index
    @unions = Union.all
  end

  def show
    @group = Group.find(params[:id])
  end
end
