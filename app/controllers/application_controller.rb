class ApplicationController < ActionController::Base
  add_flash_types :success, :warning, :info, :danger
  before_action :require_login

  def not_authenticated
    redirect_to login_path, warning: t('.defaults.not_authenticated')
  end
end
