class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to boards_path, success: t('.success')
    else
      flash[:danger] = t('.failed')
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, success: t('.logout')
  end
end
