class Api::V1::TripsController < Api::V1::BaseController

skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy, :weather]

  def index

    @trips = Trip.where(user_id: params[:user_id])
    # @trips = Trip.all
    render json: @trips
  end

  def show
    @trip = Trip.find(params[:id])
    @user = User.find(params[:user_id])
    is_guest =  Guest.where(user: @user, trip: @trip).length >= 1
    activities = @trip.activities.order(:date)
    render json: {trip: @trip, is_guest: is_guest, activities: activities}
  end
  # api.openweathermap.org/data/2.5/forecast/daily?q={city name}&cnt={cnt}&appid={API key}

  def weather
    @location = @trip.location
     url = 'api.openweathermap.org/data/2.5/forecast?q='
    api_key = '&appid=1833b3712a66b3e8a38bdf8f99dada0a'
    @weather = RestClient.get("#{url}#{@location}#{api_key}")
    @readable_weather = JSON.parse(@weather)
    return @readable_weather
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = User.find(params[:user_id])
    @trip.save!
    @guest = Guest.new(trip: @trip, user: @trip.user, name: @trip.user.name, is_admin: true)
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
