
class Web::InstructorsController < Web::ApplicationController
  
  def index
    title t (:instructors)
    add_breadcrumb :home, :root_path
    add_breadcrumb :index, :instructors_path
    @instructors = Instructor.asc_by_last_name.page(params[:page]).per(configus.per_page_count.instructors).decorate
  end

  def show
    add_breadcrumb :index, :instructors_path
    @instructor = Instructor.find(params[:id]).decorate
    add_breadcrumb @instructor, :instructor_path
    title t (:instructors)
    title @instructor

  end
end
