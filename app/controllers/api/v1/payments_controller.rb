class Api::V1::PaymentsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token, only: [:index, :create, :update, :destroy]

  def index
    @trip = Trip.find(params[:trip_id])
    @payments = Payment.where(trip: @trip).reverse
    no_of_guests = Guest.where(trip: @trip).length

    total_amount = 0
    @payments.each do |payment|
      payment.split ? total_amount += payment.amount/no_of_guests : total_amount += payment.amount
    end
    render json: { payments: @payments, total_amount: total_amount}
  end

  def create
    @payment = Payment.new(payment_params)
    @trip = Trip.find(params[:trip_id])
    @payment.trip = @trip
    # no_of_guests = Guest.where(trip: @trip)
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
    params.require(:payment).permit(:amount, :category, :content, :date, :trip_id)
  end

end


# Add a new collumn Boolean, split
