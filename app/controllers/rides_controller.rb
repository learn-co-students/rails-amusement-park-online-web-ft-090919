class RidesController < ApplicationController
  include UsersHelper
  include ApplicationHelper
  before_action :require_login

  def create
    @attraction = Attraction.find(params[:attraction_id])
    @user = current_user

    errors = Ride.check(@user, @attraction)
    if !errors.nil?
      redirect_to user_path(@user), alert: "#{errors[0]}"
    else
      
      Ride.create_ride(@user, @attraction)
      redirect_to user_path(@user), alert: "Thank you for riding #{@attraction.name}"

    end
  end

end
