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

  def batch
    @user2 = @grade.users.find(params[:id])
    @user = User.new
  end

  def batchupgrade
    @user = @grade.users.find(params[:id])
    #byebug
    if @user.update(user_params)
      flash[:success] = "批量输入成功!"
      redirect_to grade_user_path(@grade,@user)
    else
      flash[:error] = "批量输入不成功，请检查是否重复？。"
      @user2 = @user
      @user = User.new
      render :batch
    end
  end

  private

  def find_grade
    @grade = Grade.find(params[:grade_id])
  end

  def user_params
    params.require(:user).permit(:stuno,:name,:major,researches_attributes: [:id,:title,:magazine,:self_write,:publish_time,:words_count,:author ])
  end
end
