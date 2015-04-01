class User < ActiveRecord::Base
  belongs_to :grade  # :class,class_name =>'User'
  has_many :scores
  has_many :courses,:through => :scores
  has_many :researches

  validates :name, presence: true
  VALID_STUNO_REGEX = /\A\d+\Z/
  validates :stuno, presence: true,format: {with: VALID_STUNO_REGEX },uniqueness: true
end
