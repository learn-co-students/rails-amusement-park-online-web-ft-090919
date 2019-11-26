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
    @attraction = Attraction.find_by(id: params[:id])
    @ride = @attraction.rides.build(user_id: current_user.id) if current_user
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    if @attraction.update(attraction_params)
      flash[:alert] = "Succesfully Updated Attraction!"
      redirect_to attraction_path(@attraction)
    else
      flash[:alert] = @attraction.errors.full_messages
      render 'edit'
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
