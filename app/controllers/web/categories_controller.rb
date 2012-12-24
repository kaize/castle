class Web::CategoriesController < Web::ApplicationController
  def show
    @category = Category.find(params[:id])
    add_breadcrumb @category.name, :category_path
  end
end
