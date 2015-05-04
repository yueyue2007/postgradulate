class CoursesController < ApplicationController
  before_action :find_course, only: [:edit,:show, :update,:destroy,:batch,:batchupgrade]
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
    @score = Score.new
    @scores = @course.scores#.sort_by{|x| x.user.stuno}
    session[:course_id] = @course.id
    session[:stuno] = nil
  end

  def batch
    @grade = Grade.find_by_id(params[:grade])

    unless @grade
      flash[:error] = "请先选择班级！"
      redirect_to course_path(@course)
    else
      @course2 = @course
      @course = Course.new
      @grade.users.sort_by{|x| x.stuno}.each do |user|
        score =  @course.scores.build
        score.course_score = user.score(@course2)  #若已经存在成绩，则取出并删除，删除在score函数中实现。
        score.user = user
      end
    end

  end

  def batchupgrade
    # first delete all the score record of @course,@grade
    if @course.update(course_params)
      flash[:success] = "批量输入成功!"
      redirect_to course_path(@course)
    else
      flash[:error] = "批量输入不成功，请检查是否重复？。"
      redirect_to course_path(@course)
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :teacher,scores_attributes: [:id,:user_id,:course_id,:course_score,:_destroy])
  end

  def find_course
    @course = Course.find(params[:id])
  end
end
