class Web::CategoriesController < Web::ApplicationController

  def index
    add_breadcrumb :index, :categories_path
    @category = Category.all
  end

  def show
    @category = Category.find(params[:id])
    add_breadcrumb @category.name, :category_path
  end
end
