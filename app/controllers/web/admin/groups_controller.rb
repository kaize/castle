class Web::Admin::GroupsController < Web::Admin::ApplicationController
  def index
    @q = Group.ransack params[:q]
    @groups = @q.result.page(params[:page])
  end

  def new
    @group = GroupType.new
  end

  def edit
    @group = GroupType.find(params[:id])
  end

  def create
    @group = GroupType.new params[:group]

    if @group.save
      flash_success
      redirect_to admin_groups_path
    else
      flash_error
      render action: :new
    end
  end

  def update
    @group = GroupType.find params[:id]

    if @group.update_attributes params[:group]
      flash_success
      redirect_to edit_admin_group_path(@group)
    else
      flash_error
      render action: :edit
    end
  end

  def destroy
    @group = Group.find params[:id]
    @group.destroy
    redirect_to admin_groups_path
  end
end
