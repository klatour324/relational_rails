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

  def edit
    @library = Library.find(params[:id])
  end

  def public?
    @libraries = Libraries.find(params[:id])
    false if @libraries.public == nil

    true
  end

  def update
    library = Library.find(params[:id])
    library.update({
      name: params[:library][:name],
      public: params[:library][:public],
      years_opened: params[:library][:years_opened]
      })

    library.save

    redirect_to '/libraries/#{library.id}'
  end
end
