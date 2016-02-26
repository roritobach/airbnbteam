class Announce < ActiveRecord::Base
  belongs_to :user
  has_many :photos, class_name: 'AnnouncePhoto', dependent: :destroy
  validates :name, :description, presence: true
  validates :user, presence: true

  # geocoded_by :full_street_address
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def first_photo
    if self.photos.first.nil?
      ""
    else
      self.photos.first.photo_url(:standard)
    end
  end

  # def full_street_address
  # [address, city, state, country].compact.join(', ')
  # end

end
