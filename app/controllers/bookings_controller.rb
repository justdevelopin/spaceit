class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @bookings = current_user.bookings

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.space = Space.find(params[:space_id])
    total_days = (@booking.end_date - @booking.starting_date).to_i
    @booking.total_price = total_days * @booking.space.price

    if @booking.save
      respond_to do |format|
        format.json { render json: { status: :created, booking: @booking, total_price: @booking.total_price } }
        format.html { redirect_to @booking.space, notice: "Booking was successfully created." }
      end
    else
      respond_to do |format|
        format.json { render json: @booking.errors, status: :unprocessable_entity }
        format.html { render :new }
      end
    end
  end


  private

  def booking_params
    params.require(:booking).permit(:starting_date, :end_date)
  end
end
end
