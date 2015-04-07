class Course < ActiveRecord::Base
  has_many :scores,dependent: :delete_all
  has_many :users, :through => :scores
  validates :name,presence: true
end
