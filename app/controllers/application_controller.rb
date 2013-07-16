class ApplicationController < ActionController::Base
  include AuthHelper
  include Converters
  protect_from_forgery
end
