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
    p "eraewr"
    p @payment
      checking_res = content_check(@payment.content, @payment.category)
    if checking_res == 0
      @trip = Trip.find(params[:trip_id])

      unless params[:guest_id] == "none"
        # find the budget with trip_id and guest_id and deduct payment amount from that budget only
        guest = Guest.find(params[:guest_id])
        budget = Budget.find_by(guest_id: guest.id, trip_id: @trip.id)
        budget.amount = budget.amount - @payment.amount.to_i
        budget.save
      else
        # count how many budgets for this trip, divide by that number, and deduct the result from each buddget
        people_count = @trip.guests.length
        @trip.budgets.each do |budget|
          budget.amount -= @payment.amount.to_i / people_count
          budget.save
        end
      end

      @payment.trip = @trip
      # no_of_guests = Guest.where(trip: @trip)
      @payment.save
      render json: @payment
    #   @activity.time = @activity.time.strftime("%I:%M%p")
    #   @activity.save!
    #   render json: @activity
    else
      render json: { error: "content not ok"}
    end
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
    params.require(:payment).permit(:amount, :split, :category, :content, :date, :trip_id)
  end

end


# Add a new collumn Boolean, split
