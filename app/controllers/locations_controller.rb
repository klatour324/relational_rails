class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
  end

  def create
    location = Location.new({
      name: params[:location][:name],
      population: params[:location][:population].to_i,
      urban: (params[:location][:urban] == "on"),
      created_at: Time.now,
      updated_at: Time.now
      })

    location.save

    redirect_to '/locations'
  end

  def show
    @location = Location.find(params[:id])
  end
end
