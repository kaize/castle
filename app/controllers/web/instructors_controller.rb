class Web::InstructorsController < Web::ApplicationController
 # add_breadcrumb I18n.t('.home'), :root_path
#  add_breadcrumb :index, :instructors_path
  
  def index
    add_breadcrumb :home, :root_path
    add_breadcrumb :index, :instructors_path
    @instructors = Instructor.page(params[:page]).decorate
  end

  def show
    add_breadcrumb :index, :instructors_path
    @instructor = Instructor.find(params[:id]).decorate
    add_breadcrumb @instructor, :instructor_path
  end
end
