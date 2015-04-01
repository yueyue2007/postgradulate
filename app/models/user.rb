class User < ActiveRecord::Base
  belongs_to :grade  # :class,class_name =>'User'
  has_many :scores
  has_many :courses,:through => :scores
  has_many :researches
end
