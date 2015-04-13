class Score < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  def user_stuno
    user.stuno
  end

  def user_name
    user.name
  end
end
