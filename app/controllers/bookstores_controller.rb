class BookstoresController < ApplicationController
  def index
    @bookstores = Bookstore.open_to_the_public
  end

  def show
    @bookstore = Bookstore.find(params[:id])
  end

  def edit
    @bookstore = Bookstore.find(params[:id])
  end

  def update
    bookstore = Bookstore.find(params[:id])
    bookstore.update ({
        name: params[:bookstore][:name],
        inventory: params[:bookstore][:inventory],
        open: params[:bookstore][:open]
      })

    bookstore.save
    redirect_to "/bookstores/#{bookstore.id}"
  end

  def destroy
    Bookstore.destroy(params[:id])

    redirect_to "/bookstores"
  end
end
