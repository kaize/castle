
class Web::InstructorsController < Web::ApplicationController
  
  def index
    add_breadcrumb :home, :root_path
    add_breadcrumb :index, :instructors_path
    @q = Instructor.ransack(params[:q])
    if params[:q].nil? 
      @instructors = @q.result.page(params[:page]).decorate.order('last_name ASC')
    else
      @instructors = @q.result.page(params[:page]).decorate
    end
  end

  def show
    add_breadcrumb :index, :instructors_path
    @instructor = Instructor.find(params[:id]).decorate
    add_breadcrumb @instructor, :instructor_path
  end
end
