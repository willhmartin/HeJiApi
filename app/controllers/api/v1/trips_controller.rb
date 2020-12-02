class Api::V1::TripsController < Api::V1::BaseController

skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index

    @trips = Trip.where(user_id: params[:user_id])

    # @trips = Trip.all
    render json: @trips
  end

  def show
    @trip = Trip.find(params[:id])
    render json: @trip
  end

  def create
    @trip = Trip.new(trip_params)
    # @trip.user_id = User.find(params[:user_id])
    @trip.save
    render json: @trip
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    render json: @trip
  end

  def destroy
    @trip = Trip.find(params[:id])
    render json: @trip
    @trip.destroy
  end

  # private
  def trip_params
    params.require(:trip).permit( :title, :location, :start_date, :end_date, :user_id)
  end
end
