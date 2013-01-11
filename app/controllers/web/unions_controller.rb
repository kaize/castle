class Web::UnionsController < Web::ApplicationController
  def show
    @category = Category.find(params[:category_id])
    @union = @category.unions.find(params[:id])
    add_breadcrumb @category.name, category_path(@category)
    add_breadcrumb @union.name, category_union_path(@category, @union)
  end

  def index
    @category = Category.find(params[:category_id])
    @unions = @category.unions
  end
end
