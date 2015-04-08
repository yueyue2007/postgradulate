class GradesController < ApplicationController
  before_action :find_grade, only: [:edit,:show, :update,:destroy,:batch,:batchupgrade]
  before_action :login_required

  def index
    @grades = Grade.all
  end

  def new
    @grade = Grade.new
  end

  def batch
    @grade2 = @grade
    @grade = Grade.new
  end

  def batchupgrade
    #byebug
    if @grade.update(grade_params)
      flash[:success] = "批量输入成功!"
      redirect_to grade_path(@grade)
    else
      flash[:error] = "批量输入不成功，请检查学号是否重复？。"
      @grade2 = @grade
      @grade = Grade.new
      render :batch
    end
  end

  def create
    @grade = Grade.new(grade_params)

    if @grade.save
      flash[:success] = "成功建立班级！"
      redirect_to grades_path
    else
      render :new
    end
  end

  def edit
    #@grade = Grade.find(params[:id])
  end

  def update
    if @grade.update(grade_params)
      flash[:success] = "班级资料已更新！"
      redirect_to grades_path
    else
      render :edit
    end
  end

  def destroy
    @grade.destroy

    redirect_to grades_path
  end

  def show
    #@grade = Grade.find(params[:id])
    @users = @grade.users 
  end

  private

  def grade_params
    params.require(:grade).permit(:name, :description,users_attributes:[:id,:name,:stuno,:major])
  end

  def find_grade
    @grade = Grade.find(params[:id])
  end
end
