class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
    @trip=Trip.new
  end

  def create
    @trip=Trip.new(trip_params)
    if @trip.save
      redirect_to trips_path
    else
      render :new
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  private

  def trip_params
    params.require(:trip).permit(
      :name,
      :date_of_trip,
      :location,
      :activities,
      :trip_type,
    )
  end
end
