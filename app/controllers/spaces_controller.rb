class SpacesController < ApplicationController
  def show
    @space = Space.find(params[:id])
  end

  def index
    @spaces = spaces.all(params[:id])
  end

  def create
    @space = space.new
  end

end
