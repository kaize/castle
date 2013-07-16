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
  #include AuthHelper
  #include TestSupport
  include FactoryGirl::Syntax::Methods
  include TestAuthHelper
end

#WARNING: monkey patch for skip http auth in admin zone
module AuthHelper
  def authenticate_admin
  end

  def api_authenticate_admin
  end
end

def fixture_file_upload(path, mime_type = nil, binary = false)
  fixture_path = ActionController::TestCase.fixture_path
  Rack::Test::UploadedFile.new("#{fixture_path}#{path}", mime_type, binary)
end

# TODO Remove after move images on server
Fog.mock!
connection = Fog::Storage.new(provider: configus.fog_credentials.provider)
connection.directories.create(key: configus.fog_credentials.bucket)
