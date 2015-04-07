class ResearchesController < ApplicationController
  before_action :find_research, only:[:edit,:update,:destroy]
  def edit
    #@research = Research.find(params[:id])
  end

  def update
   # @research = Research.find(params[:id])

    if @research.update(research_params)
      flash[:success] = "成功更新一条科研记录！"
    end
    redirect_to grade_user_path(@research.user.grade,@research.user)
  end

  def destroy
    @research.destroy
    flash[:success] = "成功删除一条科研记录！"
    redirect_to grade_user_path(@research.user.grade,@research.user)
  end

  def create
    @user = User.find_by_stuno(session[:stuno])
    @research = Research.new(research_params)
    @research.user = @user
    if @research.save
      flash[:success] = "成功输入一条科研记录！"
    end

    redirect_to grade_user_path(@user.grade,@user)
  end

  private

  def research_params
    params.require(:research).permit(:title,:magazine,:self_write,:publish_time,:words_count,:author)
  end

  def find_research
    @research = Research.find(params[:id])
  end
end
