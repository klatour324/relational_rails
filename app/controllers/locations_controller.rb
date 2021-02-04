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
      urban: params[:location][:urban],
      created_at: params[:location][:created_at],
      updated_at: params[:location][:updated_at]
      })

    location.save
    redirect_to '/locations'
  end

  def show
    @location = Location.find(params[:id])
  end

  def urban?
    @location = Location.find(params[:id])
    if @location == nil
      false
    else
      true
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    location = Location.find(params[:id])
    location.update({
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
