class SpacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @spaces = Space.all
  end

  def show
    @space = Space.find(params[:id])
    @booking = Booking.new
  end

  def new
    @space = Space.new
  end

  def create
    @space = current_user.spaces.new(space_params)

    if @space.save
      redirect_to @space, notice: 'Space was successfully created.'
    else
      render :new
    end

  end

  private

  def space_params

    params.require(:space).permit(:name, :description, :price, :image)
  end
end
