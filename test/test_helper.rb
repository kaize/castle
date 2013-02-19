require 'simplecov'
SimpleCov.start('rails') if ENV["COVERAGE"]
require "test/unit"

require 'coveralls'
Coveralls.wear!('rails')

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  #include AuthHelper
  #include TestSupport
  include FactoryGirl::Syntax::Methods
  
  require 'thinking_sphinx/test'
  ThinkingSphinx::Test.init
end

def fixture_file_upload(path, mime_type = nil, binary = false)
  fixture_path = ActionController::TestCase.fixture_path
  Rack::Test::UploadedFile.new("#{fixture_path}#{path}", mime_type, binary)
end
