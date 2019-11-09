class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :delete]

  def show
    @ride = @attraction.rides.build(user_id: current_user.id)
  end

  def new
    @attraction = Attraction.new
  end

  def index
    @attractions = Attraction.all
  end

  def create
    @attraction = Attraction.create(attraction_params)

    redirect_to attraction_path(@attraction)
  end

  def edit
  end

  def update
    @attraction.update(attraction_params)

    redirect_to attraction_path(@attraction)
  end

  private

  def set_attraction
    @attraction = Attraction.find_by_id(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :happiness_rating, :nausea_rating, :tickets, :min_height)
  end
end
