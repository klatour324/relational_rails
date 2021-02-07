class LocationBookstoresController < ApplicationController

  def index
    binding.pry
    @location = Location.find(params[:id])
    @location.bookstores
  end

  def new
  end

  def create
    location = Location.find(params[:id])
    bookstore = location.bookstores.create ({
      name: params[:bookstore][:name],
      inventory: params[:bookstore][:inventory],
      open: params[:bookstore][:open]
      })

    bookstore.save
    redirect_to '/locations/#{params[:id]}/bookstores'
  end

end
