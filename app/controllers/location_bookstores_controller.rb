class LocationBookstoresController < ApplicationController

  def index
    @location = Location.find(params[:id])
    @location.bookstores
  end

end
