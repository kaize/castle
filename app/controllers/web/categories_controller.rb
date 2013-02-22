class Web::CategoriesController < Web::ApplicationController
  
  def index
    title "Расписание"
    add_breadcrumb :home, :root_path
    add_breadcrumb :index, :categories_path
    @category = Category.scoped
  end

  def show
    @category = Category.find(params[:id])
    add_breadcrumb @category.name, :category_path
    title @category
  end
end
