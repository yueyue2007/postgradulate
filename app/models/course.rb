class Course < ActiveRecord::Base
  has_many :scores,dependent: :delete_all
  has_many :users, :through => :scores
  validates :name,presence: true

  accepts_nested_attributes_for :scores,:allow_destroy => true

  def with_blank_scores(n=10)
    n.times do
      scores.build
    end
    self
  end
end
