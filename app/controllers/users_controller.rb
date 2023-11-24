class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])

    @spaces = @user.spaces
    @bookings = @user.bookings
  end
end
