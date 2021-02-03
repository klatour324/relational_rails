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
end
