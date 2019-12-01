class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        authentication_required
        @user = current_user
    end

    def ride
        ride = Ride.create(:user_id => current_user.id, :attraction_id =>params[:attraction][:id])
        flash[:notice] = ride.take_ride
        redirect_to user_path(current_user)
    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end


    
end
