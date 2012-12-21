class Web::CategoriesController < Web::ApplicationController
  def show
    @category = Category.find(params[:id])
  end
end
