class BookmarksController < ApplicationController
  def index
    @bookmarks = current_user.bookmarks
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      redirect_to bookmarks_path, status: :see_other
    end
  end

  def create
    bookmark = Bookmark.new
    bookmark.user = current_user
    bookmark.space = Space.find(params[:space])
    if bookmark.save
      redirect_to bookmarks_path
    end
  end
end
