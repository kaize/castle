class Web::Admin::PartnersController < Web::Admin::ProtectedApplicationController

  def index
    @partners = Partner.asc_by_order_at
  end

  def new
    @partner = Partner.new
  end

  def create
    @partner = Partner.new params[:partner]
    if @partner.save
      flash_success
      redirect_to action: :index
    else
      flash_error

      render :new
    end
  end

  def edit
    @partner = Partner.find params[:id]
  end

  def update
    @partner = Partner.find params[:id]
    if @partner.update_attributes params[:partner]
      flash_success
      redirect_to action: :index
    else
      flash_error

      render :edit
    end
  end

  def destroy
    partner = Partner.find params[:id]
    partner.destroy

    flash_success
    redirect_to action: :index
  end

end
