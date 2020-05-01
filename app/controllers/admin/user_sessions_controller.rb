class Admin::UserSessionsController < Admin::BaseController
  skip_before_action :require_login
  layout 'admin_login'
  def new

  end

  def create
    @user = login(params[:email], params[:password])
    if @user && @user.admin?
      redirect_to admin_starter_path, success: t('.success')
    else
      redirect_to root_path, warning: t('.warning')
    end
  end

  def destroy
    @user = logout
    binding.pry
    redirect_to admin_login_path, success: t('.success')
  end
end