class Web::Categories::Unions::GroupsController < Web::ApplicationController
  add_breadcrumb :schedules, :categories_path

  def show
    @group = Group.find(params[:id]).decorate
    add_breadcrumb @group.name, schedule_path
  end
end
