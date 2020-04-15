class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
