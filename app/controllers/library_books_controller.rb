class LibraryBooksController < ApplicationController
  def index
    @library = Library.find(params[:library_id])
    if !params[:title].nil?
      @books = @library.books.filter_by_pages(params[:title])
    elsif !params[:alpha_sort].nil?
      @books = @library.books.sort_alphabetically
    else
      @books = @library.books
    end
  end

  def new
    @library = Library.find(params[:library_id])
  end

  def create
    library = Library.find(params[:library_id])
    book = library.books.new(book_params)

    book.save

    redirect_to "/libraries/#{library.id}/books"
  end

  private
  
  def book_params
    params.require(:book).permit(:title, :checked_out, :pages)
  end
end
