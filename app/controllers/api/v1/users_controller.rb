class Api::V1::UsersController < Api::V1::BaseController

skip_before_action :verify_authenticity_token, only: [:create]

  def show # access user for their info and related info
    @user = User.find(params[:id])
    render json: @user # ???
  end

  def create # instantiate user once they enter miniprogram
    user = User.new(user_params)
    @user.save
    render json: @user
  end

private
  def user_params
    params.require(:user).permit(:name)
  end
end
