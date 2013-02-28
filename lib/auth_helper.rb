module AuthHelper
  def authenticate_admin
    authenticate_or_request_with_http_basic do |username, password|
      username == configus.admin.auth.username && password == configus.admin.auth.password
    end
  end
end
