class CommentsController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    @comment = @board.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      # redirect_to board_path(@board), success: t('.success')
    else
      @comments = @board.comments.all.order(created_at: :desc)
      render 'error_create.js.erb'
      # render template: 'boards/show'
    end
  end

  def update
    @comment = current_user.comments.find(params[:id])
    if @comment.update(comment_params)
      render json: @comment
    else
      render 'error_update.js.erb', status: :bad_request
    end
  end

  def destroy
    @comment = current_user.comments.find_by(params[:id])
    @comment.destroy!
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
