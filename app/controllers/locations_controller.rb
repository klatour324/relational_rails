class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
  end

  def create
    location = Location.new({name: params[:location][:name]})

    location.save

    redirect_to '/locations'
  end

  def show
  end 
end
