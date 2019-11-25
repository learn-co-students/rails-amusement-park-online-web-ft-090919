class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(session_params)
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private
    def session_params
        params.require(:user).permit(:name)
    end
end