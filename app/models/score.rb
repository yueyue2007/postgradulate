class Score < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  validates :user_id, presence: true
  validates :course_id, presence: true

  def user_stuno
    user.stuno
  end

  def user_name
    user.name
  end

end
