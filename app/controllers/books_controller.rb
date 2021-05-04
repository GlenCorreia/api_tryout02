class BooksController < ApplicationController
  def index
    render json: Book.all # default 200 status code
  end

  def create
    book = Book.new(book_params)

    if book.save
      render json: book, status: :created
    else
      render json: book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find(params[:id]).destroy! # Find a book by the params hash
    head :no_content
  rescue ActiveRecord::RecordNotDestroyed
    render json: {}, status: :unprocessable_entity
  end

  private

    def book_params
      params.require(:book).permit(:title, :author)
    end
end
