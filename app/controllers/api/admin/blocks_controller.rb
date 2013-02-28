class Api::Admin::BlocksController < Api::Admin::ApplicationController
  def mass_update_order
    block_ids = params[:ids]
    blocks = Block.find block_ids

    block_ids.map!(&:to_i)

    blocks.each do |block|
      order = block_ids.index(block.id)
      block.update_attribute :order_at, order
    end

    head :ok
  end
end
