class ApplicationController < ActionController::Base
  include AuthHelper
  include Converters
  protect_from_forgery

  helper_method :user_signed_in?
end
