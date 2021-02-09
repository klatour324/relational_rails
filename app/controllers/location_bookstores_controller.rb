class LocationBookstoresController < ApplicationController

  def index
    binding.pry
    # if params[:user_input_inventory] != nil
    #   @location = Location.find(params[:id])
    #   @location.bookstores_by_inventory(params[:user_input_inventory].to_i)
    # else
    #   @location = Location.find(params[:id])
    #   @location.bookstores
    # end
    @location = Location.find(params[:id])
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
