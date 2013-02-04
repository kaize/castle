class Web::InstructorsController < Web::ApplicationController
  
  add_breadcrumb :index, :instructors_path
  
  def index
    @instructors = Instructor.page(params[:page])
  end

  def show
    @instructor = Instructor.find(params[:id])
    add_breadcrumb @instructor, :instructor_path
  end
end
