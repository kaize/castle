class Web::ApplicationController < ApplicationController
  include FlashHelper
  helper_method :title

  add_breadcrumb :index, :root_path, only: :show

  before_filter do
    title t('base_name')
    @blocks = Block.published
  end

  private

  def base_title
    title t("title.base")
  end

  def title(part = nil)
    @parts ||= []
    unless part
      return nil if @parts.blank?
      return @parts.reverse.join(' - ')
    end
    @parts << part
  end
end
