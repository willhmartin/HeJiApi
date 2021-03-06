class Api::V1::GuestsController < Api::V1::BaseController

skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @guests = Guest.where(user_id: params[:user_id])
    render json: @guests
  end

  def show
    @guest = Guest.find(params[:id])
    render json: @guest
  end

  def create
    @user = User.find(params[:user_id])
    @guest = Guest.new(guest_params)
    @guest.user = User.find(params[:user_id])
    @guest.save!
    render json: @guest
  end

  private

  def guest_params
    params.require(:guest).permit(:name, :user_id, :trip_id)
  end
end
