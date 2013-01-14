class Web::Admin::CategoriesController < Web::Admin::ApplicationController
  def index
    @q = Category.search(params[:q])
    @categories = @q.page(params[:page])
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new params[:category]

    if @category.save
      flash_success
      redirect_to admin_categories_path
    else
      flash_error
      render action: :new
    end
  end

  def update
    @category = Category.find params[:id]

    if @category.update_attributes params[:category]
      flash_success
      redirect_to edit_admin_category_path(@category)
    else
      flash_error
      render action: :edit
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to admin_categories_path
  end
end
