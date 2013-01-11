class Web::InstructorsController < Web::ApplicationController
  add_breadcrumb :index, :instructors_path
  def index
    @instructors = Instructor.page(params[:page]).decorate
  end

  def show
    @instructor = Instructor.find(params[:id]).decorate
    add_breadcrumb @instructor, :instructor_path
  end
end
