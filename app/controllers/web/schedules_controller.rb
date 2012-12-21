class Web::SchedulesController < Web::ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @groups = Group.all
    @group = Group.find(params[:id])
  end
end
