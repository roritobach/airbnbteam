class User < ActiveRecord::Base

  has_many :announces, dependent: :destroy
  mount_uploader :photo, AvatarUploader
  validates :email, uniqueness: true, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
