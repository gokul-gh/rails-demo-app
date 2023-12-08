class StudentsController < ApplicationController
  before_action :set_college, except: [:all_student]
  before_action :set_department, except: [:all_student]
  before_action :set_student, except: [:all_student, :index, :new, :create]

  def index
    @students = @department.students.all
  end

  def show
    @remark = @student.remarks.new
    @rating = @student.group_by_rating
  end

  def all_student
    if params[:from].present? && params[:to].present?
      @students = Student.includes(:department).filter_student(params[:from], params[:to]).paginate(page: params[:page], per_page: 10)
      @from = params[:from]
      @to = params[:to]
    else
      @students = Student.includes(:department).filter_student.paginate(page: params[:page], per_page: 10)
      @from = Date.yesterday 
      @to = Date.today 
    end
  end

  def new
    @student = @department.students.new
  end

  def create
    @student = @department.students.new(student_params.merge(college_id: @college.id))
    @student.area_of_interests_attributes = get_area_of_interests
    if @student.save
      respond_to do |format|
        redirect_to college_department_students_path(@college, @department), notice: "Student created successfully"
        format.js
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    @student.assign_attributes(student_params.merge(college_id: @college.id))
    @student.area_of_interests_attributes = get_area_of_interests
    if @student.save
      redirect_to college_department_students_path(@college, @department), notice: "Student updated successfully"
    else
      render :edit
    end
  end

  def destroy
    if @student.destroy
      redirect_to college_department_students_path(@college, @department, @student), notice: "Student deleted successfully"
    end
  end

  def performance_rating
    @student.performance_ratings.create(rating: student_params.dig('rating'), staff_id: current_staff.id)
    redirect_to college_department_students_path(@college, @department)
  end

  private
  def set_college
    @college = College.find(params[:college_id])
  end

  def set_department
    @department = @college.departments.find(params[:department_id])
  end

  def set_student
    @student = @department.students.find(params[:id])
  end

  def student_params
    params.fetch(:student, {}).permit(:name, :date_of_birth, :roll_no, :image, :rating, area_of_interest_ids: [])
  end

  def get_area_of_interests
    aoi = []
    if params[:student][:area_of_interests_attributes]
      params[:student][:area_of_interests_attributes][:name].split(',').each do |n|
        aoi.push({name: n})
      end
    end
    aoi
  end
end
