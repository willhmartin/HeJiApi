require 'date'
require 'rest-client'
# 1833b3712a66b3e8a38bdf8f99dada0a



class Api::V1::ActivitiesController < Api::V1::BaseController
   skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    @activities = Activity.where(trip_id: params[:trip_id])
    @daily_activities = @activities.where(date: Date.today)
  end

  def show
    @activity = Activity.find(params[:id])
    render json: @activity
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.trip = Trip.find(params[:trip_id])
    checking_res = content_check(@activity.content, @activity.location, @activity.transportation, @activity.lodging)
    if checking_res == 0
      @activity.time = @activity.time.strftime("%I:%M%p")
      @activity.save!
      render json: @activity
    else
      render json: { error: "content not ok"}
    end
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update (activity_params)
    render json: @activity
    # if @activity.update(activity_params)
    #   redirect_to @activity
    # else
    #   render 'edit'
    # end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    render json: @activity
    # redirect_to @activity
  end


  private

  def activity_params
    params.require(:activity).permit(:content, :location, :date, :time, :transportation, :lodging, :trip_id, :user_id)
  end

end
