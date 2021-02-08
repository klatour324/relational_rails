class BooksController < ApplicationController
  def index
    @books = Book.all
    @books = Book.is_checked_out
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update({
    title: params[:book][:title],
    checked_out: params[:book][:checked_out],
    pages: params[:book][:pages]
    })

    redirect_to "/books/#{book.id}"
  end

  def destroy
    Book.destroy(params[:id])

    redirect_to "/books"
  end
end
