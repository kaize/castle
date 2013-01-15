class Web::Admin::InstructorsController < Web::Admin::ApplicationController
  def index
    @q = Instructor.ransack(params[:q])
    @instructors = @q.result.page(params[:page])
  end

  def new
    @instructor = Instructor.new
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def create
    @instructor = Instructor.new params[:instructor]

    if @instructor.save
      flash_success
      redirect_to admin_instructors_path
    else
      flash_error
      render action: :new
    end
  end

  def update
    @instructor = Instructor.find(params[:id])

    if @instructor.update_attributes params[:instructor]
      flash_success
      redirect_to edit_admin_instructor_path(@instructor)
    else
      flash_error
      render action: :edit
    end
  end

  def destroy
    @instructor = Instructor.find(params[:id])
    @instructor.destroy
    redirect_to admin_instructors_path
  end
end
