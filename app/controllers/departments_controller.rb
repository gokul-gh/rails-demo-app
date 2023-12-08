class DepartmentsController < ApplicationController
  before_action :set_college
  before_action :set_department, only: %i[show edit update destroy]
  def index
    @departments = @college.departments.all
  end

  def show

  end

  def new
    @department = @college.departments.new
  end

  def create
    @department = @college.departments.new(department_params)
    if @department.save
      respond_to do |format|
        redirect_to college_departments_path(@college), notice: "Department created successfully"
        format.js
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @department.update(department_params)
      respond_to do |format|
        redirect_to college_departments_path(@college), notice: "Department updated successfully"
        format.js
      end
    else
      reder :edit
    end
  end

  def destroy
    @department.destroy
    respond_to do |format|
      redirect_to college_departments_path(@college), notice: "Department deleted successfully"
      format.js
    end
  end

  private
  def set_college
    @college = College.find(params[:college_id])
  end

  def set_department
    @department = @college.departments.find(params[:id])
  end

  def department_params
    params.require(:department).permit(:name, :department_code)
  end
end
