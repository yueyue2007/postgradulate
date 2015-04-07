class UsersController < ApplicationController
  before_action :find_grade #,except: :show
  before_action :login_required 

  def new
    @user = @grade.users.build
  end

  def create
    @user = @grade.users.new(user_params)

    if @user.save
      flash[:success] = "成功建立一位学生资料！"
      redirect_to grade_path(@grade)
    else
      render :new
    end
  end

  def edit
    @user = @grade.users.find(params[:id])
  end

  def update
    @user = @grade.users.find(params[:id])

    if @user.update(user_params)
      flash[:success] = "资料已更新成功！"
      redirect_to grade_path(@grade)
    else
      render :edit
    end
  end

  def destroy
    @user = @grade.users.find(params[:id])
    @user.destroy

    redirect_to grade_path(@grade)

  end

  def show 
    @user = @grade.users.find(params[:id])
    @score = Score.new
    @research = Research.new
    #@score.user = @user
    #flash[:stuno] = "20120003"   #save the current user id
    session[:stuno] = @user.stuno
  end

  private

  def find_grade
    @grade = Grade.find(params[:grade_id])
  end

  def user_params
    params.require(:user).permit(:stuno,:name,:major)
  end
end
