class Api::Admin::ApplicationController < Api::ApplicationController
  before_filter :api_authenticate_admin
end
