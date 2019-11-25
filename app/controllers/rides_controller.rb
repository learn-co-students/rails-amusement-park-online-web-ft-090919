class RidesController < ApplicationController
    def create
        @attraction = Attraction.find_by(id: params[:attraction_id])
        @user = User.find_by(id: session[:user_id])
        @ride = Ride.create(user: @user, attraction: @attraction)
        message = @ride.take_ride
        flash[:alert] = message

        redirect_to user_path(@user)
    end

    private
    def ride_params
        params.permit(:attraction_id)
    end
end