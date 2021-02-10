class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
    @libraries = Library.all.order_by_created_date
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

  def update
    library = Library.find(params[:id])
    library.update({
      name: params[:library][:name],
      public: params[:library][:public],
      years_opened: params[:library][:years_opened]
      })

    redirect_to "/libraries/#{library.id}"
  end

  def destroy
    Library.destroy(params[:id])
    redirect_to '/libraries'
  end
end
