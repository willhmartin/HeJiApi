class Api::V1::BudgetsController < Api::V1::BaseController
skip_before_action :verify_authenticity_token, only: [:show, :create, :edit, :destory]

  def show # access user for their info and related info
    @budget = budget.find(params[:id])
    render json: @budget # ???
  end

  def create # instantiate user once they enter miniprogram
    @budget = Budget.new(budget_params)
    @budget.save
    render json: @budget
  end

  def edit
    @budget = Budget.find(params[:id])
    if @budget.update(budget_params)
      redirect_to @budget
    else
      render 'edit'
    end
  end

  def destory
    @budget = Budget.find(params[:id])
    @budgets.destory
    redirect_to @budget
  end


  private

  def budget_params
    params.require(:budget).permit(:amount, :trip_id, :guest_id)
  end
end
