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
      redirect_to trips_path, notice: "Trip successfully created"
    else
      render :new
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    if @trip.save
      redirect_to trips_path, notice: "Trip successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_path, notice: "Trip successfully deleted"
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
