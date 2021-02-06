class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
  end

  def create
    book = Book.new({
      title: params[:book][:title],
      checked_out: params[:book][:checked_out],
      pages: params[:book][:pages]
      })

      book.save

      redirect_to '/books'
  end
end
