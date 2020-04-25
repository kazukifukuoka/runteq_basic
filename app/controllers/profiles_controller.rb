class ProfilesController < ApplicationController
  def show; end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path, success: t('.success')
    else
      flash[:danger] = t('.failed')
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :avatar)
  end
end
