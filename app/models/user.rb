class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :announces, dependent: :destroy
<<<<<<< HEAD
    mount_uploader :photo, AvatarUploader

  validates :name, :email, uniqueness: true, presence: true
=======
  validates :email, uniqueness: true, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
>>>>>>> e0ce8b03f4f8f2d7949f5f4b5f8afa5bed7350fc
end
