class AnnouncePhoto < ActiveRecord::Base
  belongs_to :announce
  mount_uploader :photo, PhotoUploader
end
