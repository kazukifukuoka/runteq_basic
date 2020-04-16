class BoardsController < ApplicationController
  def index
    @boards = Board.all.includes(:user).order(created_at: :desc)
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.user_id = current_user.id
    if @board.save!
      redirect_to boards_path, success: '掲示板を作成しました'
    else
      flash[:danger] = '掲示板を作成できませんでした'
      render :new
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, :body)
  end
end
