class Admin::DashboardsController < Admin::BaseController
  layout 'admin'
  def index
    if current_user.admin?
      @user = current_user
    else
      redirect_to root_path, warning: '権限がありません'
    end
  end
end
