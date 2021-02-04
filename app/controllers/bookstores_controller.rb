class BookstoresController < ApplicationController

  def index
    @bookstores = Bookstore.all
  end

  def new
  end

  def create
    binding.pry
    bookstore = Bookstore.new({
      name: params[:bookstore][:name],
      inventory: params[:bookstore][:inventory],
      open: params[:bookstore][:open],
      location: self.location
      })

    bookstore.save
    binding.pry
    redirect_to '/bookstores'
  end
end
