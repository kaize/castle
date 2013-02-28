class Web::Admin::BlocksController < Web::Admin::ApplicationController
  def index
    @blocks = Block.asc_by_order_at
  end
  
  def new
    @block = Block.new
  end
  
  def edit
    @block = Block.find params[:id]
  end
  
  def create
    @block = Block.new params[:block]
  
    if @block.save
      flash_success
      redirect_to admin_blocks_path
    else
      flash_error
      render action: :new
    end
  end
  
  def update
    @block = Block.find(params[:id])

    if @block.update_attributes params[:block]
      flash_success
      redirect_to edit_admin_block_path(@block)
    else
      flash_error
      render action: :edit
    end
  end
  
  def destroy
    @block = Block.find params[:id]
    @block.destroy
    redirect_to admin_blocks_path
  end
end
