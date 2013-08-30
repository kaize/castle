class Web::Admin::SessionsController < Web::Admin::ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:user][:email])

    if user && user.authenticate(params[:user][:password])
      sign_in user
      redirect_to admin_root_path
    else
      render action: :new
    end
  end

  def destroy
    sign_out
    redirect_to admin_root_path
  end
end
