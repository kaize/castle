class Api::Admin::PartnersController < Api::Admin::ApplicationController
  def mass_update_order
    partner_ids = params[:ids]
    partners = Partner.find partner_ids

    partner_ids.map!(&:to_i)

    partners.each do |partner|
      order = partner_ids.index(partner.id)
      partner.update_attribute :order_at, order
    end

    head :ok
  end
end
