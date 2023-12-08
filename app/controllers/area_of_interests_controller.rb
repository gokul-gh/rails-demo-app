class AreaOfInterestsController < ApplicationController
  def index
    @area_of_interests = AreaOfInterest.all
    @area_of_interest = AreaOfInterest.new
  end

  def create
    @area_of_interest = AreaOfInterest.create(aoi_params)
    if @area_of_interest.save
      redirect_to area_of_interests_path, notice: "area of interest created successfully"
    else
      redirect_to area_of_interests_path, notice: "Something went wrong"
    end
  end

  def destroy
    @area_of_interest = AreaOfInterest.find(params[:id])
    if @area_of_interest.destroy
      redirect_to area_of_interests_path, notice: "Area of interest destroyed successfully"
    else
      redirect_to area_of_interests_path, notice: "Something went wrong"
    end
  end

  private

  def aoi_params
    params.require(:area_of_interest).permit(:name)
  end
end
