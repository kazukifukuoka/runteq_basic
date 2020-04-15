class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(new_user_params)
    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end

  private
    def new_user_params
      params.permit(:last_name, :first_name, :email, :password, :password_confirmation)
    end
end