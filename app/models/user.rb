class User < ActiveRecord::Base
  has_many :announces
  validates :name, :email, uniqueness: true, presence: true
end
