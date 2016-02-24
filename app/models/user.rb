class User < ActiveRecord::Base
  has_many :announces, dependent: :destroy
    mount_uploader :photo, AvatarUploader

  validates :name, :email, uniqueness: true, presence: true
end
