class Course < ActiveRecord::Base
  has_many :scores
  has_many :users, :through => :scores
end
