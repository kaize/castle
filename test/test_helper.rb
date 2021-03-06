require 'simplecov'
SimpleCov.start('rails') if ENV["COVERAGE"]
require "test/unit"
require 'webmock/minitest'
require 'coveralls'
Coveralls.wear!('rails') if ENV["COVERAGE"]

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
Dir[Rails.root.join("test/support/**/*.rb")].each {|f| require f}

class ActiveSupport::TestCase
  include AuthHelper
  #include TestSupport
  include FactoryGirl::Syntax::Methods
  include Wrong
end

def fixture_file_upload(path, mime_type = nil, binary = false)
  fixture_path = ActionController::TestCase.fixture_path
  Rack::Test::UploadedFile.new("#{fixture_path}#{path}", mime_type, binary)
end
