class Announce < ActiveRecord::Base
  belongs_to :user
  has_many :photos, class_name: 'AnnouncePhoto', dependent: :destroy
  validates :name, :description, presence: true
  validates :user, presence: true

  geocoded_by :description
  after_validation :geocode, if: :description_changed?

  def first_photo
    if self.photos.first.nil?
      ""
    else
      self.photos.first.photo_url(:standard)
    end
  end
end
