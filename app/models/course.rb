class Course < ActiveRecord::Base
  has_many :scores,dependent: :delete_all
  has_many :users, :through => :scores
  validates :name,presence: true

  accepts_nested_attributes_for :scores , :reject_if => lambda {|attrs| attrs.all? {|key,value| value.blank?}}

  def with_blank_scores(n=5)
    n.times do
      scores.build
    end
    self
  end

  def score(userid)
    Score.find_by(user_id:userid,course_id:id)
  end
end
