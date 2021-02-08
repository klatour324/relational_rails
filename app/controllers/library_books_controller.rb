class LibraryBooksController < ApplicationController
  def index
    @library = Library.find(params[:library_id])
  end

  def new
    @library = Library.find(params[:library_id])
  end

  def create
    library = Library.find(params[:library_id])
    book = library.books.create!({
      title: params[:book][:title],
      checked_out: params[:book][:checked_out],
      pages: params[:book][:pages]
      })

    redirect_to "/libraries/#{library.id}/books"
  end
end
