class SpacesController < ApplicationController

  def index
  @spaces = spaces.all(params[:id])
  end

  def create
    @space = space.new
  end
  
end
