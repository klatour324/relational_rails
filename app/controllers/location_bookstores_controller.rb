class LocationBookstoresController < ApplicationController

  def index
    @location = Location.find(params[:id])
    if params[:user_input_inventory] == nil
      @location.bookstores
    else
      @location.bookstores_by_inventory(params[:user_input_inventory])
    end
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

    redirect_to "/locations/#{params[:id]}/bookstores"
  end
end
