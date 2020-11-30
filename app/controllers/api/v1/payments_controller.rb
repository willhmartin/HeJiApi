class Api::V1::PaymentsController < Api::V1::BaseController


  def index
    @payment = Payment.all
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.save
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
