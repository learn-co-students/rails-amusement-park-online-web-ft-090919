class AttractionsController < ApplicationController 

    before_action :admin_access, except: [:index, :show]

    def new 
    end 

    def index
        @attractions = Attraction.all
    end 

    def show
        @attraction = Attraction.find_by(id: params[:id])
    end 

    def create
        @attraction = Attraction.create(attraction_params)
        if @attraction
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
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else 
            render :new 
        end 
    end 

    private

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end 

end 
 
