class Admin::DashboardsController < Admin::BaseController
  layout 'admin'
  def index
    @user = current_user
  end

end