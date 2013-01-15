class Web::Admin::UnionsController < Web::Admin::ApplicationController
  def index
    @q = Union.ransack(params[:q])
    @unions = @q.result.page(params[:page])
  end

  def new
    @union = UnionType.new
  end

  def edit
    @union = UnionType.find(params[:id])
  end

  def create
    @union = UnionType.new params[:union]

    if @union.save
      flash_success
      redirect_to admin_unions_path
    else
      flash_error
      render action: :new
    end
  end

  def update
    @union = UnionType.find(params[:id])

    if @union.update_attributes params[:union]
      flash_success
      redirect_to edit_admin_union_path(@union)
    else
      flash_error
      render action: :edit
    end
  end

  def destroy
    @union = UnionType.find(params[:id])
    @union.destroy
    redirect_to admin_unions_path
  end
end
