class Api::V1::GuestsController < Api::V1::BaseController

skip_before_action :verify_authenticity_token, only: [:create]

  def show
    @guest = Guest.find(params[:id])
    render json: @guest
  end

  def create
    @guest = Guest.new(guest_params)
    @guest.save
    render json: @guest
  end

  private
  def guest_params
    params.require(:guest).permit(:name)
  end
end
