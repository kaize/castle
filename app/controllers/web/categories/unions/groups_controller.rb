class Web::Categories::Unions::GroupsController < Web::ApplicationController
  def show
    @group = Group.find(params[:id])
    add_breadcrumb @group.name, schedule_path
    title @group
  end
end
