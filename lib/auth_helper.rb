module AuthHelper
  def authenticate_admin
    authenticate_or_request_with_http_basic do |username, password|
      username == configus.admin.auth.username && password == configus.admin.auth.password
    end
  end

  def api_authenticate_admin
    #TODO: put here specific admin api logic
    authenticate_admin
  end
end
