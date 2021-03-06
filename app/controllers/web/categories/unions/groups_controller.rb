class Web::Categories::Unions::GroupsController < Web::ApplicationController
  def show
    @group = Group.find(params[:id])
    
    title @group
    
    add_breadcrumb :schedules, :categories_path
    add_breadcrumb @group.name, :schedule_path
  end
end
