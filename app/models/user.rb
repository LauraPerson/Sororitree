class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:nickname]
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :requests
  has_many :posts
  has_many :selected_themes
  has_many :themes, through: :selected_themes
  has_many :matching_profiles
  has_many :messages
  has_many :chatroom
  has_one_attached :photo
  has_one :professional, dependent: :destroy
  has_one :profile_avatar
  has_one :avatar, through: :profile_avatar
  validates :nickname, presence: true, uniqueness: { case_sensitive: false }

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:nickname)
      where(conditions).where(["lower(nickname) = :value", { value: login.downcase }]).first
    else
      where(conditions).first
    end
  end

end
