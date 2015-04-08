class Grade < ActiveRecord::Base
  has_many :users,dependent: :delete_all

  validates :name,presence: true

  accepts_nested_attributes_for :users

  def with_blank_users(n = 5)
    n.times do
      users.build
    end
    self
  end
end
