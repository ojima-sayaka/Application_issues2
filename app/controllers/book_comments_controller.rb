class BookCommentsController < ApplicationController
# before_action :correct_user, only: [:edit]

  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    # ↑book_book_comments_path
    comment.book_id = book.id
    comment.save
    redirect_back(fallback_location:book_path(book))
  end

  def destroy
    book = Book.find(params[:id])
    if book.user == current_user
    book.destroy
    redirect_back(fallback_location:book_path(book))
    end
  end




private

 def book_comment_params
  params.require(:book_comment).permit(:comment)
 end

  # def book_params
  #   params.require(:book).permit(:title, :body, :user_id)
  # end

  # def correct_user
  #   @book = Book.find(params[:id])
  #   unless @book.user == current_user
  #   redirect_to books_path
  #   end
  # end
end