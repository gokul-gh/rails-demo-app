class RemarksController < ApplicationController
	before_action :set_student
  before_action :set_department
  before_action :set_college
  def create
    @remark = @student.remarks.new(remark_params)
    if @remark.save
      redirect_to college_department_students_url(@college, @department), notice: "Remark Added"
    else
      redirect_to college_department_student_url(@college, @department, @student), notice: "Remark not Added"
    end
  end

  def destroy
    @remark = @student.remarks.find(params[:id])
    if @remark.destroy
      redirect_to college_department_student_url(@college, @department, @student), notice: "Remark Deleted"
    else
      redirect_to college_department_student_url(@college, @department, @student), notice: "Error Occured"
    end
  end

  private

  def set_student
    @student = Student.find_by(id: params[:student_id])
  end

  def set_college
    @college = College.find(params[:college_id])
  end

  def set_department
    @department = Department.find(params[:department_id])
  end

  def remark_params
    params.fetch(:remark, {}).permit(:remark_detail)
  end
end
