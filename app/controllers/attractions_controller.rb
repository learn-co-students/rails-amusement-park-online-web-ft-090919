class AttractionsController < ApplicationController
    def index
        @user = User.find_by(id: session[:user_id])
        @attractions = Attraction.all
    end

    def show
        @user = User.find_by(id: session[:user_id])
        @attraction = Attraction.find_by(id: params[:id])
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
            render :new
        end
    end

    def edit
        @attraction = Attraction.find_by(id: params[:id])

    end

    def update
        @attraction = Attraction.find_by(id: params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)

    end

    private
    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :min_height, :nausea_rating, :happiness_rating)
    end
end