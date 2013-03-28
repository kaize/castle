class Web::CategoriesController < Web::ApplicationController
  

  
  def index
    title t(:categories)

    add_breadcrumb :home, :root_path
    @categories = Category.scoped
  end
  
  def show
    @categories = Category.scoped
    @category = Category.find(params[:id])
    add_breadcrumb @category.name, :category_path
    title @category
  end
  
end
