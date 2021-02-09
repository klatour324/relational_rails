class LocationsController < ApplicationController
  def index
    @locations = Location.all.sort_by_recently_created
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
end
