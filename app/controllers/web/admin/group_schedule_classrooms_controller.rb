class Web::Admin::GroupScheduleClassroomsController < Web::Admin::ApplicationController
  def index
    @classrooms = Group::Schedule::Classroom.page(params[:page])
  end

  def new
    @classroom = Group::Schedule::Classroom.new
  end

  def create
    @classroom = Group::Schedule::Classroom.new params[:group_schedule_classroom]
    if @classroom.save
      flash_success
      redirect_to action: :index
    else
      flash_error

      render :new
    end
  end

  def edit
    @classroom = Group::Schedule::Classroom.find params[:id]
  end

  def update
    @classroom = Group::Schedule::Classroom.find params[:id]
    if @classroom.update_attributes params[:group_schedule_classroom]
      flash_success
      redirect_to action: :index
    else
      flash_error
      
      render :edit
    end
  end

  def destroy
    classroom = Group::Schedule::Classroom.find params[:id]
    classroom.destroy

    flash_success
    redirect_to action: :index
  end
end