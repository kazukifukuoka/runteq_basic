class CommentsController < ApplicationController
  protect_from_forgery except: :update
  def create
    puts 'aaaaa'
    @board = Board.find(params[:board_id])
    @comment = @board.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      # redirect_to board_path(@board), success: t('.success')
    else
      puts '失敗'
      @comments = @board.comments.all.order(created_at: :desc)
      render 'error_ajax.js.erb'
      # render template: 'boards/show'
    end
  end

  def update
    @comment = current_user.comments.find(params[:id])
    @comment.update(comment_params)
    render json: @comment
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
