class Api::V1::BudgetsController < Api::V1::BaseController
skip_before_action :verify_authenticity_token, only: [:show, :create, :update, :destroy]

  def index
    p "testing ---------"
    p params
  end
  def show # access user for their info and related info
    p 'showing one budget'
    budgets = Budget.where(guest_id: params[:guest_id], trip_id: params[:trip_id])
    if budgets.empty?
      render json: {budget: false}
    else
      render json: {budget: budgets.first, payments: budgets.first.payments}
    end
    # @budget = Budget.find(params[:id])
    # render json: @budget # ???
  end

  def create # instantiate user once they enter miniprogram
    @budget = Budget.new(budget_params)
    if @budget.save
      render json: @budget
    else
      render json: @budget.errors.full_messages
    end
  end

  def update
    @budget = Budget.find(params[:id])
    @budget.update(budget_params)
    render json: @budget

    # if @budget.update(budget_params)
    #   redirect_to @budget
    # else
    #   render 'edit'
    # end
  end

  # def subtract
  #   @budget = Budget.find(params[:id])
  #   (@budget.value - @payment).to_i
  #   @budget.save
  #   render json: @budget
  # end


  def destroy
    @budget = Budget.find(params[:id])

    @budget.destroy
    render json: @budget

    # redirect_to @budget
  end


  private

  def budget_params
    params.require(:budget).permit(:amount, :trip_id, :guest_id)
  end
end
