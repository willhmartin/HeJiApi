class Api::V1::PaymentsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token, only: [:index, :create, :update, :destroy]

  def index
    @payments = Payment.where(trip_id:params[:trip_id])
    render json: @payments
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.trip = Trip.find(params[:trip_id])
    @payment.save
    render json: @payment
  end

  def update
    @payment = Payment.find(params[:id])
    @payment.update(payment_params)
    render json: @payment
  end

  def destroy
    @payment = Payment.find(params[:id])
    render json: @payment
    @payment.destroy
  end

  private

  def payment_params
    params.require(:payment).permit(:amount, :category, :content, :trip_id)
  end

end
