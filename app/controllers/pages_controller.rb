class PagesController < ApplicationController
 # before_action :login_required

  def home
    if current_admin
      redirect_to grades_path
    end
  end

  def display
    @name = params[:name].lstrip.rstrip
    @stuno = params[:stuno].lstrip.rstrip
    @user = User.find_by_stuno(@stuno)
    unless (@user && @user.name == @name)
      flash[:now] = "学号或者姓名不正确，请重新输入！"
      redirect_to root_path
    end

  end
end
