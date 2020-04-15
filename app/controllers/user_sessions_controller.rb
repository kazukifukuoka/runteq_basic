class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to root_path
      flash[:success] = 'ログインしました'
    else
      redirect_to login_path
      flash[:danger] = 'ログインに失敗しました'
    end
  end

  def destroy
    logout
    redirect_to root_path
    flash[:sucess] = 'ログアウトしました'
  end
end
