class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
  end

  def new
  end

  def create
    library = Library.new({
      name: params[:library][:name],
      public: params[:library][:public],
      years_opened: params[:library][:years_opened]
      })

    library.save

    redirect_to '/libraries'
  end

  def show
    @library = Library.find(params[:id])
  end
end
