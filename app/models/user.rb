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
  has_one_attached :photo
  validates :nickname, presence: true, uniqueness: { case_sensitive: false }
end
