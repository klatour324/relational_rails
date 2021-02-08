class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
  end

  def create
    location = Location.new({
      name: params[:location][:name],
      population: params[:location][:population],
      urban: params[:location][:urban]
      })

    location.save
    redirect_to '/locations'
  end

  def show
    @location = Location.find(params[:id])
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    location = Location.find(params[:id])
    location.update ({
        name: params[:location][:name],
        population: params[:location][:population],
        urban: params[:location][:urban]
      })

    location.save
    redirect_to "/locations/#{location.id}"
  end

  def destroy
    Location.destroy(params[:id])
    redirect_to '/locations/'
  end

  # def bookstores
  #   @location = Location.find(params[:location_id])
  #   @location.bookstores
  # end
  #
  # def new_bookstore
  #   location = Location.find(params[:location_id])
  #   bookstore = location.bookstores.new ({
  #     name: params[:bookstore][:name],
  #     inventory: params[:bookstore][:inventory],
  #     open: params[:bookstore][:open],
  #     location_id: params[:bookstore][:location_1]
  #     })
  #
  #   bookstore.save
  #
  #   redirect_to "/locations/#{location.id}/bookstores"
  # end
end
