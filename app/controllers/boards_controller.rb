class BoardsController < ApplicationController
  before_action :authenticate_user, only: :index

  def index
    @boards = Board.all
  end

  private

  def authenticate_user
    redirect_to login_path, danger: t('.path_login') unless current_user
  end
end