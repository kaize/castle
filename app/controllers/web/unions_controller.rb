class Web::UnionsController < Web::ApplicationController
  def show
    @category = Category.find(params[:category_id])
    @union = @category.unions.find(params[:id])
  end

  def index
    @category = Category.find(params[:category_id])
    @unions = @category.unions
  end
end
