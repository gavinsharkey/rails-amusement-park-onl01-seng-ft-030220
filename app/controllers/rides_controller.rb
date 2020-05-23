class RidesController < ApplicationController
  def create
    attraction = Attraction.find_by(id: params[:attraction_id])
    ride = Ride.create(user: current_user, attraction: attraction)
    flash[:notice] = ride.take_ride
    redirect_to user_path(current_user)
  end
end
