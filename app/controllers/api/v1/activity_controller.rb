class Api::V1::ActivitiesController < Api::V1::BaseController
  def index
    @activity = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def create
    @activity = activity.new(activity_params)
    if @activity.save
      redirect_to @activity
    else
      render 'new'
    end
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      redirect_to @activity
    else
      render 'edit'
    end
  end

  def destory
    @activity = Activity.find(params[:id])
    @activity.destory
    redirect_to @activity
  end


  private

  def activity_params
    params.require(:activity).permit(:content, :location, :date, :time, :transportation, :lodging, :trip_id, :user_id)
  end

end
