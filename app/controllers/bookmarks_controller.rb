class BookmarksController < ApplicationController
  def create
    # @bookmark = current_user.bookmarks.create(board_id: params[:board_id])
    @board = Board.find(params[:board_id])
    current_user.bookmark(@board)
    # redirect_back fallback_location: root_path, success: t('.success')
  end

  def destroy
    # @bookmark = Bookmark.find_by(board_id: params[:board_id], user_id: current_user.id)
    @board = current_user.bookmarks.find_by(params[:id]).board
    current_user.unbookmark(@board)
    # redirect_back fallback_location: root_path, success: t('.success')
  end
end
