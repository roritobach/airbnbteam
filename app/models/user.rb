class User < ActiveRecord::Base
  has_many :announces, dependent: :destroy
  validates :name, :email, uniqueness: true, presence: true
end
