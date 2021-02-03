class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
  end

  def new
  end

  def create
    library = Library.new({name: params[:library][:name]})

    library.save

    redirect_to '/libraries'
  end

  def show
    @library = Library.find(params[:id])
  end
end
