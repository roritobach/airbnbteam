class User < ActiveRecord::Base
    after_create :send_welcome_email


    devise :omniauthable, omniauth_providers: [:facebook]


  has_many :announces, dependent: :destroy
  mount_uploader :photo, AvatarUploader
  validates :email, uniqueness: true, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

   def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

end
