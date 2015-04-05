class CoursesController < ApplicationController
  before_action :find_course, only: [:edit,:show, :update,:destroy]
  before_action :login_required

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:success] = "成功建立课程！"
      redirect_to courses_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @course.update(course_params)
      flash[:success] = "课程资料已更新！"
      redirect_to courses_path
    else
      render :edit
    end
  end

  def destroy
    @course.destroy

    redirect_to courses_path
  end

  def show

  end

  private

  def course_params
    params.require(:course).permit(:name, :teacher)
  end

  def find_course
    @course = Course.find(params[:id])
  end
end