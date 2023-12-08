class CollegesController < ApplicationController
  before_action :set_college, only: %i[show edit update destroy]
  def index
    @colleges = College.all
  end

  def show
  end

  def new
    @college = College.new
  end

  def create
    @college = College.new(college_params)
    if @college.save
      respond_to do |format|
        redirect_to colleges_path, notice: "College created successfully"
        format.js
      end
    else
      format.js
      render :new
    end
  end

  def edit
  end

  def update
    if @college.update(college_params)
      respond_to do |format|  
        redirect_to colleges_path, notice: "College updated successfully"
        format.js
      end
    else
      render :edit
    end
  end

  def destroy
    @college.destroy

    redirect_to colleges_path, notice: "College destroryed successfully"
  end

  private
  def set_college
    @college = College.find(params[:id])
  end

  def college_params
    params.require(:college).permit(:name)
  end
end
