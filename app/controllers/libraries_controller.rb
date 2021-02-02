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
end
