class Api::V1::UsersController < Api::V1::BaseController

skip_before_action :verify_authenticity_token, only: [:create] # ???

  def show # access user for their info and related info
    @user = User.find(params[:id])
    render json: @user # if this isn't here and you make api call, won't get any response to see it works
    # needs a json file to read the answer (answer in this format)
  end

  def create # instantiate user once they enter miniprogram
    @user = User.new(user_params)
    @user.save
    render json: @user
  end

private
  def user_params
    params.require(:user).permit(:name)
  end
end
