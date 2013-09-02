class Web::Admin::SessionsController < Web::Admin::ApplicationController
  def new
    @session = UserSignInType.new
  end

  def create
    @session = UserSignInType.new(params[:user_sign_in_type])

    if @session.valid?
      reset_session

      user = @session.user
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
