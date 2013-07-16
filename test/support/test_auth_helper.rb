module TestAuthHelper
  def http_login
    header = ActionController::HttpAuthentication::Basic.encode_credentials configus.admin.auth.username,
                                                                            configus.admin.auth.password
    request.env['HTTP_AUTHORIZATION'] = header
  end
end