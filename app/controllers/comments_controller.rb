class CommentsController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    @comment = @board.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to board_path(@board), success: t('.success')
    else
      @comments = @board.comments.all.order(created_at: :desc)
      flash[:danger] = t('.failed')
      render template: 'boards/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end