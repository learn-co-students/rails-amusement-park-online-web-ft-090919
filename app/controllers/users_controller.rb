class UsersController < ApplicationController 

    def new 
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else 
            redirect_to new_user_path 
        end 
    end 

    def show
        logged_in
        @user = User.find(params[:id])

        if @user.rides
         @ride = @user.rides.first
        end 
    end

    private 

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end 

end 


