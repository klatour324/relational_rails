class LocationBookstoresController < ApplicationController

  def index
    @location = Location.find(params[:id])
    @location.bookstores
  end

  def new
    @location = Location.find(params[:id])
  end

  def create
    location = Location.find(params[:id])
    bookstore = location.bookstores.create ({
      name: params[:bookstore][:name],
      inventory: params[:bookstore][:inventory],
      open: params[:bookstore][:open]
      })

    bookstore.save
    redirect_to "/locations/#{params[:id]}/bookstores"
  end
end
