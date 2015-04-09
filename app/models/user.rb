class User < ActiveRecord::Base
  belongs_to :grade  # :class,class_name =>'User'
  has_many :scores,dependent: :delete_all
  has_many :courses,:through => :scores
  has_many :researches,dependent: :delete_all

  validates :name, presence: true
  VALID_STUNO_REGEX = /\A\d+\Z/
  validates :stuno, presence: true,format: {with: VALID_STUNO_REGEX },uniqueness: true

  accepts_nested_attributes_for :researches , :reject_if => lambda {|attrs| attrs.all? {|key,value| value.length<2}}
  #accepts_nested_attributes_for :users , :reject_if => lambda {|attrs| attrs.all? {|key,value| value.blank?}}
  def with_blank_researches(n=5)
    n.times do
      researches.build
    end
    self
  end

end
