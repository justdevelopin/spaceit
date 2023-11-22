# app/controllers/spaces_controller.rb
class SpacesController < ApplicationController
  def index
    @spaces = Space.all
  end

  def show
    @space = Space.find(params[:id])
    @booking = Booking.new
  end

  def create
    @space = space.new
  end

  def new
    @space = Space.new

  private

  def space_params
    params.require(:space).permit(:name, :description, :image, :other_attributes)
  end
end
end
