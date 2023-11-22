# app/controllers/spaces_controller.rb
class SpacesController < ApplicationController
  def index
    @spaces = Space.all
  end


private

def space_params
  params.require(:space).permit(:name, :description, :image, :other_attributes)
end

end
