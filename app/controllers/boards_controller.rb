class BoardsController < ApplicationController
  before_action :set_board, only: %i[show edit destroy]

  def index
    @boards = Board.all.includes(:user).order(created_at: :desc)
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to boards_path, success: t('.success')
    else
      flash[:danger] = t('.failed')
      render :new
    end
  end

  def show
    @comment = @board.comments.build
    @comments = @board.comments.all.order(created_at: :desc)
  end

  def edit; end

  def update
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to board_path(@board), success: t('.success')
    else
      flash[:danger] = t('.failed')
      render :edit
    end
  end

  def destroy
    redirect_to boards_path, success: t('.success') if @board.destroy!
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, :board_image)
  end

  def set_board
    @board = current_user.boards.find(params[:id])
  end
end
