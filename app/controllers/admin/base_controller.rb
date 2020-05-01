class Admin::BaseController < ApplicationController
  # before_action :is_admin?

  # private
  # def is_admin?
  #   return unless current_user
  #   return if current_user.admin?
  #   redirect_to root_path, danger: '権限がありません'
  # end
end