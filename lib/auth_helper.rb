module AuthHelper
  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def user_signed_in?
    session[:user_id]
  end

  def authenticate_user!
    redirect_to new_admin_session_path unless user_signed_in?
  end

  def api_authenticate_admin
    #TODO: put here specific admin api logic
    authenticate_user!
  end
end
