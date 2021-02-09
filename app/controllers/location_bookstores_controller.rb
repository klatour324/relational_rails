class LocationBookstoresController < ApplicationController

  def index
    @location = Location.find(params[:id])
    if params[:user_input_inventory] != nil
      @bookstores = @location.bookstores_by_inventory(params[:user_input_inventory].to_i)
    elsif params[:alphabetize] != nil
      @bookstores = @location.abc_bookstores
    else
      @bookstores = @location.bookstores
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
