class Web::InstructorsController < Web::ApplicationController
  def index
    @instructors = Instructor.page(params[:page])
  end

  def show
    @instructor = Instructor.find(params[:id])
  end
end
