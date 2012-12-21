class Web::ApplicationController < ApplicationController
  #include AuthHelper
  include FlashHelper

  helper_method :title

  before_filter do
    title t('base_name')
  end

  private

  def title(part = nil)
    @parts ||= []
    unless part
      return nil if @parts.blank?
      return @parts.reverse.join(' - ')
    end
    @parts << part
  end
end
