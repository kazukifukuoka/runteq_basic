class Admin::UserSessionsController < Admin::BaseController
  skip_before_action :require_login
  layout 'admin_login'
  def new
    # redirect_to root_path, warning: '権限がありません' if current_user.general?
  end

  def create
    @user = login(params[:email], params[:password])
    if @user&.admin?
      redirect_to admin_root_path, success: t('.success')
    else
      redirect_to admin_login_path, danger: t('.warning')
    end
  end

  def destroy
    @user = logout
    redirect_to admin_login_path, success: t('.success')
  end
end
