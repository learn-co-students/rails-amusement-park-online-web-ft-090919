class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.new(attraction_params)
    if attraction.valid?
      attraction.save
      redirect_to attraction
    else
      flash[:alert] = "There was a problem creating the attraction!"
      render 'new'
    end
  end

  def show
    @attraction = Attraction.find_by(params[:id])
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
