class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]
  def show; end

  def edit; end

  def update
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

  def set_user
    @user = User.find(current_user.id)
  end
end
