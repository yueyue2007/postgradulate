class ScoresController < ApplicationController
  before_action :find_score, only:[:edit,:update,:destroy]

  def create
    if session[:stuno]
      @user = User.find_by_stuno(session[:stuno])
      session[:stuno] = nil
      @score = Score.new(score_params)
      @score.user = @user
      @course = Course.find(params[:score][:course_id])
      @score.course = @course
      if @score.save
        flash[:success] = "成功输入一门课程成绩！"
      end
      redirect_to grade_user_path(@user.grade,@user)
    else
      @score = Score.new(score_params)
      @course = Course.find(session[:course_id])
      session[:course_id] = nil
      @user = User.find(params[:score][:user_id])
      @score.course = @course
      @score.user = @user

      if @score.save
        flash[:success] = "从course成功输入一条成绩单！"
      end
      redirect_to course_path(@course)
      end
  end

  def edit
  end

  def update
    if @score.update(score_params)
      flash[:success] = "成功更新一门课程成绩！"
    end
    redirect_to grade_user_path(@score.user.grade,@score.user)
  end

  def destroy
    @score.destroy
    flash[:success] = "成功删除一门课程成绩！"
    redirect_to grade_user_path(@score.user.grade,@score.user)
  end

  private

  def find_score
    @score = Score.find(params[:id])
  end

  def score_params
    params.require(:score).permit(:user,:course,:course_score)
  end
end
