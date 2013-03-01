class PartnersCell < Cell::Rails
  def index
    @partners = Partner.asc_by_order_at
    render
  end
end
