# app/controllers/spaces_controller.rb
class SpacesController < ApplicationController
  def index
    @spaces = Space.all
  end
  # other actions
end
