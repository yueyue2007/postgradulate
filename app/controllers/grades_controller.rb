class GradesController < ApplicationController
  before_action :find_grade, only: [:edit,:show, :update,:destroy]
  before_action :login_required

  def index
    @grades = Grade.all
  end

  def new
    @grade = Grade.new
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
  end

  private

  def grade_params
    params.require(:grade).permit(:name, :description)
  end

  def find_grade
    @grade = Grade.find(params[:id])
  end
end
