class User < ActiveRecord::Base
  belongs_to :grade  # :class,class_name =>'User'
  has_many :scores,dependent: :delete_all
  has_many :courses,:through => :scores
  has_many :researches,dependent: :delete_all

  validates :name, presence: true
  VALID_STUNO_REGEX = /\A\d+\Z/
  validates :stuno, presence: true,format: {with: VALID_STUNO_REGEX },uniqueness: true
end
