class Web::UnionsController < Web::ApplicationController
  def show
    @category = Category.find(params[:category_id])
    @union = @category.unions.find(params[:id])
    add_breadcrumb @category.name, :category_path
    add_breadcrumb @union.name, category_union_path(@category, @union)
  end
end
