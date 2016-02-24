class Announce < ActiveRecord::Base
  belongs_to :user
  has_many :photos, class_name: 'AnnouncePhoto', dependent: :destroy
  validates :name, :description, presence: true
end
