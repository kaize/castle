class Web::InstructorsController < Web::ApplicationController
  
  def index
    add_breadcrumb :home, :root_path
    add_breadcrumb :index, :instructors_path
    @instructors = Instructor.page(params[:page]).asc_by_last_name.decorate
  end

  def show
    add_breadcrumb :index, :instructors_path
    @instructor = Instructor.find(params[:id]).decorate
    add_breadcrumb @instructor, :instructor_path
  end
end
