class AttractionsController < ApplicationController
  include UsersHelper
  include ApplicationHelper
  before_action :require_login
  before_action :check_admin, only: [:new, :create, :edit, :update]


  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = find_attraction
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(strong_params)

    if @attraction.valid?
      @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render 'edit'
    end
  end
  
  def edit
    @attraction = find_attraction
  end

  def update
    @attraction = find_attraction
    @attraction.assign_attributes(strong_params)

    if @attraction.valid?
      @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render 'edit'
    end
  end

  private

  def strong_params
    params.required(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

  def check_admin
    redirect_to attractions_path if current_user.admin == false
  end

  def find_attraction
    Attraction.find(params[:id])
  end

end