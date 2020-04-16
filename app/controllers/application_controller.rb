class ApplicationController < ActionController::Base
  add_flash_types :success, :warning, :info, :danger
  before_action :set_full_name

  def set_full_name
    @user = UserDecorator.new(User.find(current_user.id)) if current_user
  end
end
