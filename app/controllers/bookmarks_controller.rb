class BookmarksController < ApplicationController
  def create
    @bookmark = current_user.bookmarks.create(board_id: params[:board_id])
    redirect_to boards_path, success: 'ブックマークしました'
  end

  def destroy
    @bookmark = Bookmark.find_by(board_id: params[:board_id], user_id: current_user.id)
    redirect_to boards_path, success: 'ブックマークを外しました' if @bookmark.destroy!
  end
end
